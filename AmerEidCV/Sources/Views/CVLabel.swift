//
//  CVLabel.swift
//  AmerEidCV
//
//  Created by Amer on 3/23/22.
//

import UIKit

class CVLabel: UIView {
    private let label = UILabel()
    private(set) var url: URL?
    private let underLineView = UIView()
    
    init(model: CVLabelModel) {
        label.font = model.font
        label.textColor = model.textColor
        label.text = model.text
        label.textAlignment = model.textAlignment
        url = model.url
        underLineView.backgroundColor = model.underlineColor
        super.init(frame: .zero)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
        layout()
    }
    
    private func setupViews() {
        addSubview(label)
        addSubview(underLineView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func layout() {
        label.pin.sizeToFit().top().start()
        underLineView.pin.start().below(of: label).marginTop(-1).width(of: label).height(1.0)
        pin.wrapContent()
    }
}
