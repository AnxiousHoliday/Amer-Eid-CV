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
        label.textColor = .black
        label.font = UIFont(name: UIFont.fontLobster, size: 18)
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let blackLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
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
        sectionHeaderLabel.pin.sizeToFit().start(10)
        lineView.pin.horizontally().height(1).below(of: sectionHeaderLabel).marginTop(5)
        blackLineView.pin.height(1).width(of: sectionHeaderLabel).vCenter(to: lineView.edge.vCenter).start(10)
        pin.wrapContent(.vertically, padding: 5)
    }
    
    private func setupViews() {
        addSubview(sectionHeaderLabel)
        addSubview(lineView)
        addSubview(blackLineView)
    }
}
