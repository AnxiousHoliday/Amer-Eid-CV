//
//  PDFRenderer.swift
//  AmerEidCV
//
//  Created by Amer Eid on 25/01/2024.
//

import UIKit
import PDFKit

struct PDFRenderer {
    static func renderPDF(from cvPages: [UIView]) throws -> PDFDocument?  {
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
        
        let bounds = CGRect(origin: .zero, size: PDFSizes.getCVPageSize())
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: bounds, format: format)
        let pdfData = pdfRenderer.pdfData { (context) in
            // Each cvPage would be rendered as a separate page in the final PDF
            for cvPage in cvPages {
                render(cvPage: cvPage)
            }
            func render(cvPage: UIView) {
                context.beginPage()
                cvPage.layer.render(in: context.cgContext)
                
                // All labels need their labels drawn while the layer itself can be rendered
                let labelsArray = cvPage.get(all: UILabel.self)
                for label in labelsArray {
                    // I have to get the frame of the labels relative to cvPage in order to draw text (it ignores frame offset from superview)
                    guard let realFrame = label.superview?.convert(label.frame, to: cvPage) else {
                        continue
                    }
                    label.drawText(in: realFrame)
                }
                
                let cvMarkupLabels = cvPage.get(all: CVMarkupLabel.self)
                // Adding URL clicks where needed
                for case let cvMarkupLabel in cvMarkupLabels {
                    guard let attributedString = cvMarkupLabel.label.attributedText else { continue }
                    let markupResults = cvMarkupLabel.markupResults
                    for markupResult in markupResults {
                        let nsrange = NSRange(markupResult.linkTextRange, in: attributedString.string)
                        guard let linkFrame = cvMarkupLabel.label.boundingRect(forCharacterRange: nsrange) else { continue }
                        
                        // I have to get the frame of the labels relative to cvPage in order to draw text (it ignores frame offset from superview)
                        guard let frame = cvMarkupLabel.superview?.convert(cvMarkupLabel.frame, to: cvPage) else {
                            continue
                        }
                        let realFrame = CGRect(x: frame.minX + linkFrame.minX + cvMarkupLabel.label.frame.minX, y: frame.minY + linkFrame.minY, width: linkFrame.width, height: linkFrame.height)
                        // Frame needs to be recalculated because setURL uses PDF coordinate space, not the Core Graphics context coordinate space.
                        // -> the origin is in the bottom-left rather than the top-left, and the y-axis increases in an upwards direction.
                        let urlFrame = CGRect(x: realFrame.minX, y: cvPage.frame.height - realFrame.minY - realFrame.height, width: realFrame.width, height: realFrame.height)
                        context.setURL(URL(string: markupResult.linkURL)!, for: urlFrame)
                    }
                }
            }
        }
        try pdfData.write(to: outputFileURL)
        return PDFDocument(data: pdfData)
    }
}
