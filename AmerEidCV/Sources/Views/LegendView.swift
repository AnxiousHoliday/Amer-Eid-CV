//
//  LegendView.swift
//  AmerEidCV
//
//  Created by Amer on 3/27/22.
//

import UIKit

class LegendView: CVSubview {
    private let greenTitleLabel = CVLabel(model: CVLabelModel(text: "Amazing", font: UIFont.p1FontRegular, textColor: .darkGray, url: nil, underlineColor: nil))
    private let redTitleLabel = CVLabel(model: CVLabelModel(text: "Good", font: UIFont.p1FontRegular, textColor: .darkGray, url: nil, underlineColor: nil))
    
    private let greenCircleView: UIView = {
        let side: CGFloat = 10
        let view = UIView(frame: CGRect(x: 0, y: 0, width: side, height: side))
        view.backgroundColor = UIColor.greenColor
        view.layer.cornerRadius = side * 0.5
        return view
    }()
    
    private let redCircleView: UIView = {
        let side: CGFloat = 10
        let view = UIView(frame: CGRect(x: 0, y: 0, width: side, height: side))
        view.backgroundColor = UIColor.yellowColor
        view.layer.cornerRadius = side * 0.5
        return view
    }()
    
    init() {
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
        greenCircleView.pin.top().start()
        redCircleView.pin.below(of: greenCircleView).marginTop(5).start()
        
        greenTitleLabel.pin.after(of: greenCircleView, aligned: .center).marginStart(5)
        redTitleLabel.pin.after(of: redCircleView, aligned: .center).marginStart(5)
        
        pin.wrapContent()
    }
    
    private func setupViews() {
        addSubview(greenCircleView)
        addSubview(redCircleView)
        
        addSubview(greenTitleLabel)
        addSubview(redTitleLabel)
    }
}
