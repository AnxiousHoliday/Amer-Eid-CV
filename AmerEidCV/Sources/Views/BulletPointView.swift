//
//  BulletPointView.swift
//  AmerEidCV
//
//  Created by Amer on 3/18/22.
//

import UIKit

class BulletPointView: CVSubview {
    private let bulletPointLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Futura", size: 12)
        return label
    }()
    
    private let bulletPointIcon: UIView = {
        let side: CGFloat = 5
        let view = UIView(frame: CGRect(x: 0, y: 0, width: side, height: side))
        view.backgroundColor = .black
        view.layer.cornerRadius = side * 0.5
        return view
    }()
    
    init(model: BulletPointModel) {
        bulletPointLabel.text = model.text
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
        bulletPointIcon.pin.start(10).top(15)
        bulletPointLabel.pin.after(of: bulletPointIcon).marginStart(10).top(10).end(10).sizeToFit(.width)
        bulletPointLabel.pin.after(of: bulletPointIcon).marginStart(10).top(10).end(10)
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(bulletPointIcon)
        addSubview(bulletPointLabel)
    }
}
