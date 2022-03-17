//
//  PersonalDataView.swift
//  AmerEidCV
//
//  Created by Amer on 3/17/22.
//

import UIKit

class CVSubview: UIView {
    func hideLabels() {
        for label in labelsArray() {
            label.isHidden = true
        }
    }
    
    func layout() { }
    
    func labelsArray() -> [UILabel] {
        var labels: [UILabel] = []
        for subview in subviews {
            guard let label = subview as? UILabel else {
                continue
            }
            labels.append(label)
        }
        return labels
    }
}

class PersonalDataView: CVSubview {
    
    private let myNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Amer Eid"
        label.textColor = .black
        label.font = UIFont(name: "Lobster1.3", size: 28)
        return label
    }()
    
    private let myEmailAddressLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("Email ".secondaryBoldTextAppearance())
        attributedString.append("amereid92@gmail.com".basicTextAppearance())
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    private let myPhoneNumberLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("Phone ".secondaryBoldTextAppearance())
        attributedString.append("+971506832163".basicTextAppearance())
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    private let myAddressLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("Location ".secondaryBoldTextAppearance())
        attributedString.append("Abu Dhabi, United Arab Emirates".basicTextAppearance())
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    private let myLinkedInProfileLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("LinkedIn ".secondaryBoldTextAppearance())
        attributedString.append("Press Me".basicLinkAppearance(link: URL(string: "https://www.linkedin.com/in/amer-eid92/")!))
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    private let myGitHubProfileLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("GitHub ".secondaryBoldTextAppearance())
        attributedString.append("Press Me".basicLinkAppearance(link: URL(string: "https://github.com/amereid")!))
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
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
        myNameLabel.pin.sizeToFit().start().top()
        myEmailAddressLabel.pin.sizeToFit().top().end()
        myPhoneNumberLabel.pin.sizeToFit().below(of: myEmailAddressLabel).marginTop(10).end()
        myAddressLabel.pin.sizeToFit().below(of: myPhoneNumberLabel).marginTop(10).end()
        myGitHubProfileLabel.pin.sizeToFit().below(of: myAddressLabel).marginTop(10).end()
        myLinkedInProfileLabel.pin.sizeToFit().before(of: myGitHubProfileLabel, aligned: .center).marginEnd(10)
        pin.wrapContent(.vertically)
        
    }
    
    private func setupViews() {
        addSubview(myNameLabel)
        addSubview(myEmailAddressLabel)
        addSubview(myPhoneNumberLabel)
        addSubview(myAddressLabel)
        addSubview(myLinkedInProfileLabel)
        addSubview(myGitHubProfileLabel)
    }
}
