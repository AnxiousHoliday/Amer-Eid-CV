//
//  SummaryView.swift
//  AmerEidCV
//
//  Created by Amer on 3/20/22.
//

import UIKit
import PinLayout

class SummaryView: CVSubview {
    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.p1FontRegular
        return label
    }()
    
    init(model: SummaryModel) {
        summaryLabel.text = model.text
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
        layout()
    }
    
    override func layout() {
        summaryLabel.pin.horizontally().sizeToFit(.width)
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(summaryLabel)
    }
}
