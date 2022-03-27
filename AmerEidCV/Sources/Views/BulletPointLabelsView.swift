//
//  BulletPointLabelsView.swift
//  AmerEidCV
//
//  Created by Amer on 3/27/22.
//

import UIKit

class BulletPointLabelsView: CVSubview {
    private var labels: [CVLabel] = []
    
    private let bulletPointIcon: UIView = {
        let side: CGFloat = 5
        let view = UIView(frame: CGRect(x: 0, y: 0, width: side, height: side))
        view.layer.cornerRadius = side * 0.5
        view.backgroundColor = .black
        return view
    }()
    
    init(model: BulletPointLabelsModel) {
        labels = model.labelsModels.map({ model in
            return CVLabel(model: model)
        })
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
        bulletPointIcon.pin.start(5).top(5)
        let sidePadding: CGFloat = 5
        var prevLabel: CVLabel?
        labels.forEach { label in
            if let prevLabel = prevLabel {
                label.pin.after(of: prevLabel, aligned: .center).marginStart(sidePadding)
            } else {
                label.pin.after(of: bulletPointIcon).marginStart(10).top()
            }
            prevLabel = label
        }
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(bulletPointIcon)
        labels.forEach { label in
            addSubview(label)
        }
    }
}
