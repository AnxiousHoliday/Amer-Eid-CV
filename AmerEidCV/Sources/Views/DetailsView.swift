//
//  DetailsView.swift
//  AmerEidCV
//
//  Created by Amer on 3/18/22.
//

import UIKit

class DetailsView: CVSubview {
    private let titleLabel: CVLabel!
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.p1FontItalic
        label.textColor = .black
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.p1FontBold
        label.textColor = .darkGray
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.p1FontItalic
        label.textColor = .black
        return label
    }()
    
    init(model: DetailsModel) {
        titleLabel = CVLabel(model: model.titleModel)
        subtitleLabel.text = model.subtitle
        dateLabel.text = model.date
        locationLabel.text = model.location
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupViews()
        layout()
    }
    
    override func layout() {
        titleLabel.pin.sizeToFit().start().top()
        subtitleLabel.pin.sizeToFit().start().below(of: titleLabel).marginTop(3)
        dateLabel.pin.sizeToFit().end().top()
        locationLabel.pin.sizeToFit().end().below(of: dateLabel).marginTop(3)
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(dateLabel)
        addSubview(locationLabel)
    }
}
