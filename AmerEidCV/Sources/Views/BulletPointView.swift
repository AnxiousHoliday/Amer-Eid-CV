//
//  BulletPointView.swift
//  AmerEidCV
//
//  Created by Amer on 3/18/22.
//

import UIKit

class BulletPointView: CVSubview {
    var style: BulletPointStyle = .normal
    
    private let bulletPointLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.p1FontRegular
        return label
    }()
    
    private let bulletPointIcon: UIView = {
        let side: CGFloat = 5
        let view = UIView(frame: CGRect(x: 0, y: 0, width: side, height: side))
        view.layer.cornerRadius = side * 0.5
        return view
    }()
    
    init(model: BulletPointModel) {
        style = model.style
        bulletPointLabel.text = model.text
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        if style == .normal {
            bulletPointIcon.backgroundColor = .black
        } else if style == .indented {
            bulletPointIcon.layer.borderColor = UIColor.black.cgColor
            bulletPointIcon.layer.borderWidth = 1.0
        }
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
        let bulletPointStart: CGFloat = style == .indented ? 25 : 5
        bulletPointIcon.pin.start(bulletPointStart).top(5)
        bulletPointLabel.pin.after(of: bulletPointIcon).marginStart(10).top().end(10).sizeToFit(.width)
        bulletPointLabel.pin.after(of: bulletPointIcon).marginStart(10).top().end(10)
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(bulletPointIcon)
        addSubview(bulletPointLabel)
    }
}
