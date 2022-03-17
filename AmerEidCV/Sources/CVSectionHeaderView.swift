//
//  CVSectionHeaderView.swift
//  AmerEidCV
//
//  Created by Amer on 3/17/22.
//

import UIKit

class CVSectionHeaderView: UIView {
    lazy var labelsArray: [UILabel] =  [sectionHeaderLabel]
    
    private let sectionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Header Title"
        label.textColor = .black
        label.font = UIFont(name: "Lobster1.3", size: 18)
        return label
    }()
    
    init(sectionHeaderTitle: String) {
        sectionHeaderLabel.text = sectionHeaderTitle
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
    
    func layout() {
        sectionHeaderLabel.pin.sizeToFit().start().top()
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(sectionHeaderLabel)
    }
}
