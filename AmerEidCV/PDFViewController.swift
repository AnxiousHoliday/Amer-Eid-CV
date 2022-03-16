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
        
        let cv = CVView()
//        cv.setNeedsLayout()
//        cv.layoutIfNeeded()
        
        
        let shareButton = UIButton(type: .system, primaryAction: UIAction(title: "Share", handler: { [weak self] action in
            guard let pdfData = self?.pdfView.document?.dataRepresentation() else { return }
            let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
            self?.present(vc, animated: true, completion: nil)
        }))
        
        view.addSubview(shareButton)
        
        shareButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
        
        shareButton.isEnabled = false
        createPDF(from: cv)
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
            
            // all labels need their labels drawn while the layer itself can be rendered
            for label in cvView.labelsArray {
                // I have to get the frame of the labels relative to cvView in order to draw text (it ignores frame offset from superview)
                guard let realFrame = label.superview?.convert(label.frame, to: cvView) else {
                    continue
                }
                label.drawText(in: realFrame)
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

