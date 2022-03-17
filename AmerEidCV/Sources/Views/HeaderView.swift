//
//  HeaderView.swift
//  AmerEidCV
//
//  Created by Amer on 3/17/22.
//

import UIKit

class HeaderView: CVSubview {
    private let sectionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Header Title"
        label.textColor = .black
        label.font = UIFont(name: "Lobster1.3", size: 18)
        return label
    }()
    
    init(model: HeaderModel) {
        sectionHeaderLabel.text = model.title
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
        sectionHeaderLabel.pin.horizontally().sizeToFit(.width).top()
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(sectionHeaderLabel)
    }
}
