//
//  CVSuperPage.swift
//  AmerEidCV
//
//  Created by Amer Eid on 24/01/2024.
//

import UIKit
import PinLayout

public class CVSuperPage: UIView {
    func getModels() -> [Any] {
        // should be subclassed
        return []
    }
    
    init() {
        let pdfSize = PDFSizes.getCVPageSize()
        super.init(frame: CGRect(x: 0, y: 0, width: pdfSize.width, height: pdfSize.height))
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        let cvSubviews: [CVSubview] = getModels().compactMap { model in
            return CVSubviewFactory.getView(model: model)
        }
        
        var prevView: CVSubview?
        cvSubviews.forEach { cvSubview in
            self.addSubview(cvSubview)
            
            let topPadding: CGFloat
            if prevView == nil {
                // first view has 25 padding to top of page
                topPadding = 25
            } else if prevView is BulletPointView && cvSubview is BulletPointView {
                // padding between bullet points is small
                topPadding = 2
            } else if cvSubview is SummaryView {
                // padding between summary view and view above it
                topPadding = 5
            } else if cvSubview is HeaderView {
                // padding between summary view and view above it
                topPadding = 5
            } else {
                topPadding = 5
            }
            
            if let prevView = prevView {
                cvSubview.pin.horizontally(PDFSizes.pageSidePadding)
                cvSubview.layout()
                cvSubview.pin.horizontally(PDFSizes.pageSidePadding).below(of: prevView).marginTop(topPadding)
            } else {
                cvSubview.pin.top(topPadding).horizontally(PDFSizes.pageSidePadding)
                cvSubview.layout()
            }
            prevView = cvSubview
        }
    }
}
