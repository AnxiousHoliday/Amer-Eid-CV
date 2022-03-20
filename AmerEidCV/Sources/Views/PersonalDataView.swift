//
//  PersonalDataView.swift
//  AmerEidCV
//
//  Created by Amer on 3/17/22.
//

import UIKit

class PersonalDataView: CVSubview {
    
    private let myNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Amer Eid"
        label.textColor = .black
        label.font = UIFont(name: "Lobster1.3", size: 45)
        return label
    }()
    
    private let jobTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lead iOS Engineer"
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "Futura", size: 14)
        return label
    }()
    
    private let myEmailAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "amereid92@gmail.com"
        label.font = UIFont(name: "OpenSans-Regular", size: 12)
        return label
    }()
    
    private let myEmailAddressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "OpenSans-Bold", size: 12)
        return label
    }()
    
    private let myPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "+971506832163"
        label.font = UIFont(name: "OpenSans-Regular", size: 12)
        return label
    }()
    
    private let myPhoneNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "OpenSans-Bold", size: 12)
        return label
    }()
    
    private let myAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Abu Dhabi, United Arab Emirates"
        label.font = UIFont(name: "OpenSans-Regular", size: 12)
        return label
    }()
    
    private let myAddressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "OpenSans-Bold", size: 12)
        return label
    }()
    
    private let myLinkedInProfileLabel: UILabel = {
        let label = UILabel()
        label.attributedText = "Press Me".basicLinkAppearance(link: URL(string: "https://www.linkedin.com/in/amer-eid92/")!)
        return label
    }()
    
    private let myLinkedInProfileTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "LinkedIn"
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "OpenSans-Bold", size: 12)
        return label
    }()
    
    private let myGitHubProfileLabel: UILabel = {
        let label = UILabel()
        label.attributedText = "Press Me".basicLinkAppearance(link: URL(string: "https://github.com/amereid")!)
        return label
    }()
    
    private let myGitHubProfileTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "GitHub"
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "OpenSans-Bold", size: 12)
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
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
        myNameLabel.pin.sizeToFit().start().top()
        jobTitleLabel.pin.sizeToFit().below(of: myNameLabel, aligned: .start)
        myPhoneNumberLabel.pin.sizeToFit().top().end()
        myPhoneNumberTitleLabel.pin.sizeToFit().before(of: myPhoneNumberLabel, aligned: .center).marginEnd(5)
        myEmailAddressLabel.pin.sizeToFit().before(of: myPhoneNumberTitleLabel, aligned: .center).marginEnd(10)
        myEmailAddressTitleLabel.pin.sizeToFit().before(of: myEmailAddressLabel, aligned: .center).marginEnd(5)
        myAddressLabel.pin.sizeToFit().below(of: myPhoneNumberLabel).marginTop(10).end()
        myAddressTitleLabel.pin.sizeToFit().before(of: myAddressLabel, aligned: .center).marginEnd(5)
        myGitHubProfileLabel.pin.sizeToFit().below(of: myAddressLabel).marginTop(10).end()
        myGitHubProfileTitleLabel.pin.sizeToFit().before(of: myGitHubProfileLabel, aligned: .center).marginEnd(5)
        myLinkedInProfileLabel.pin.sizeToFit().before(of: myGitHubProfileTitleLabel, aligned: .center).marginEnd(10)
        myLinkedInProfileTitleLabel.pin.sizeToFit().before(of: myLinkedInProfileLabel, aligned: .center).marginEnd(5)
        lineView.pin.horizontally().height(1).below(of: myLinkedInProfileLabel).marginTop(10)
        pin.wrapContent(.vertically)
        
    }
    
    private func setupViews() {
        addSubview(myNameLabel)
        
        addSubview(myEmailAddressLabel)
        addSubview(myEmailAddressTitleLabel)
        
        addSubview(myPhoneNumberLabel)
        addSubview(myPhoneNumberTitleLabel)
        
        addSubview(myAddressLabel)
        addSubview(myAddressTitleLabel)
        
        addSubview(myLinkedInProfileLabel)
        addSubview(myLinkedInProfileTitleLabel)
        
        addSubview(myGitHubProfileLabel)
        addSubview(myGitHubProfileTitleLabel)
        
//        addSubview(jobTitleLabel)
//        addSubview(lineView)
    }
}
