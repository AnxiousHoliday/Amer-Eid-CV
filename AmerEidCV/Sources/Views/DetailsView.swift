//
//  DetailsView.swift
//  AmerEidCV
//
//  Created by Amer on 3/18/22.
//

import UIKit

class DetailsView: CVSubview {
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let dateLabel = UILabel()
    private let locationLabel = UILabel()
    
    init(model: DetailsModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        dateLabel.text = model.date
        locationLabel.text = model.location
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
        titleLabel.pin.sizeToFit().start().top()
        subtitleLabel.pin.sizeToFit().start().below(of: titleLabel).marginTop(5)
        dateLabel.pin.sizeToFit().end().top()
        locationLabel.pin.sizeToFit().end().below(of: dateLabel).marginTop(5)
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(dateLabel)
        addSubview(locationLabel)
    }
}
