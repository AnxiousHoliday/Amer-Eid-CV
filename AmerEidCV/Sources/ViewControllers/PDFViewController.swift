//
//  ViewController.swift
//  AmerEidCV
//
//  Created by Amer on 3/16/22.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    private let pdfView = PDFView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(pdfView)
        pdfView.backgroundColor = .lightGray
        
        let cvView = CVView()
        
        // Hide all labels before being drawn in the pdfview so that theyre selectable
        let labelsArray = cvView.get(all: UILabel.self)
        labelsArray.forEach { label in
            label.isHidden = true
        }

        let shareButton = UIButton(type: .system, primaryAction: UIAction(title: "Share", handler: { [weak self] action in
            guard let pdfData = self?.pdfView.document?.dataRepresentation() else { return }
            let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
            self?.present(vc, animated: true, completion: nil)
        }))
        
        view.addSubview(shareButton)
        
//        shareButton.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().offset(-50)
//            make.centerX.equalToSuperview()
//        }
        
        shareButton.isEnabled = false
        createPDF(from: cvView)
        shareButton.isEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }
    
    func createPDF(from cvView: CVView) {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let outputFileURL = documentDirectory.appendingPathComponent("AmerEidCV.pdf")
        print("URL:", outputFileURL) // When running on simulator, use the given path to retrieve the PDF file
        
        let pdfMetaData = [
          kCGPDFContextCreator: "Amer Eid",
          kCGPDFContextAuthor: "Amer Eid",
          kCGPDFContextTitle: "Amer Eid CV"
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: cvView.bounds, format: format)
        let pdfData = pdfRenderer.pdfData { (context) in
            context.beginPage()
            cvView.layer.render(in: context.cgContext)
            
            // All labels need their labels drawn while the layer itself can be rendered
            let labelsArray = cvView.get(all: UILabel.self)
            for label in labelsArray {
                // I have to get the frame of the labels relative to cvView in order to draw text (it ignores frame offset from superview)
                guard let realFrame = label.superview?.convert(label.frame, to: cvView) else {
                    continue
                }
                label.drawText(in: realFrame)
            }
            
            let urlContainersArray = cvView.get(all: CVLabel.self)
            // Adding URL clicks where needed
            for case let urlContainer in urlContainersArray {
                // I have to get the frame of the labels relative to cvView in order to draw text (it ignores frame offset from superview)
                guard let realFrame = urlContainer.superview?.convert(urlContainer.frame, to: cvView) else {
                    continue
                }
                guard let url = urlContainer.url else {
                    continue
                }
                // Frame needs to be recalculated because setURL uses PDF coordinate space, not the Core Graphics context coordinate space.
                // -> the origin is in the bottom-left rather than the top-left, and the y-axis increases in an upwards direction.
                let urlFrame = CGRect(x: realFrame.minX, y: cvView.frame.height - realFrame.minY - realFrame.height, width: realFrame.width, height: realFrame.height)
                context.setURL(url, for: urlFrame)
            }
        }
        pdfView.document = PDFDocument(data: pdfData)
        pdfView.autoScales = true
        
        do {
            try pdfData.write(to: outputFileURL)
        } catch {
            print("Could not create PDF file: \(error)")
        }
    }
}
