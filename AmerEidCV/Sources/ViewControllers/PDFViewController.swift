//
//  ViewController.swift
//  AmerEidCV
//
//  Created by Amer on 3/16/22.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    private let pdfView: PDFView = {
        let view = PDFView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pdfView)
        createPDF()
        setupShareButton()
        layout()
    }
    
    private func createPDF() {
        let cvPages: [CVSuperPage] = [CVPage1()]
        for cvPage in cvPages {
            // Hide all labels before being drawn in the pdfview so that theyre selectable
            let labelsArray = cvPage.get(all: UILabel.self)
            labelsArray.forEach { label in
                label.isHidden = true
            }
        }
        do {
            pdfView.document = try PDFRenderer.renderPDF(from: cvPages)
            pdfView.autoScales = true
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    private func layout() {
        pdfView.frame = view.bounds
    }
    
    private func setupShareButton() {
        let shareButton = UIButton(type: .system, primaryAction: UIAction(title: "Share CV", handler: { [weak self] action in
            guard let pdfData = self?.pdfView.document?.dataRepresentation() else { return }
            let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
            self?.present(vc, animated: true, completion: nil)
        }))
        
        view.addSubview(shareButton)
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}
