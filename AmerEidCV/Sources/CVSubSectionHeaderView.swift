//
//  CVSubSectionHeaderView.swift
//  AmerEidCV
//
//  Created by Amer on 3/17/22.
//

import UIKit

class CVSubSectionHeaderView: UIView {
    lazy var labelsArray: [UILabel] =  [leftTitleLabel, leftSubtitleLabel, rightTitleLabel, rightSubtitleLabel]
    
    private let leftTitleLabel = UILabel()
    private let leftSubtitleLabel = UILabel()
    private let rightTitleLabel = UILabel()
    private let rightSubtitleLabel = UILabel()
    
    init(leftTitleString: NSAttributedString, leftSubtitleString: NSAttributedString, rightTitleString: NSAttributedString, rightSubtitleString: NSAttributedString) {
        leftTitleLabel.attributedText = leftTitleString
        leftSubtitleLabel.attributedText = leftSubtitleString
        rightTitleLabel.attributedText = rightTitleString
        rightSubtitleLabel.attributedText = rightSubtitleString
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
        leftTitleLabel.pin.sizeToFit().start().top()
        leftSubtitleLabel.pin.sizeToFit().start().below(of: leftTitleLabel).marginTop(5)
        rightTitleLabel.pin.sizeToFit().end().top()
        rightSubtitleLabel.pin.sizeToFit().end().below(of: rightTitleLabel).marginTop(5)
        pin.wrapContent(.vertically)
    }
    
    private func setupViews() {
        addSubview(leftTitleLabel)
        addSubview(leftSubtitleLabel)
        addSubview(rightTitleLabel)
        addSubview(rightSubtitleLabel)
    }
}
