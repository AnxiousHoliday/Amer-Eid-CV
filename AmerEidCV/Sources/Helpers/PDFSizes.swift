//
//  PDFSizes.swift
//  AmerEidCV
//
//  Created by Amer Eid on 24/01/2024.
//

import UIKit

struct PDFSizes {
    static let pdfWidthInInches: CGFloat = 8.28
    static let pdfHeightInInches: CGFloat = 11.7
    static let pixelsPerInch: CGFloat = 72.0
    static let pageSidePadding: CGFloat = 30
    
    static func getCVPageSize() -> CGSize {
        let pdfWidth = pixelsPerInch * pdfWidthInInches
        let pdfHeight = pixelsPerInch * pdfHeightInInches
        return CGSizeMake(pdfWidth, pdfHeight)
    }
}
