//
//  CVView.swift
//  AmerEidCV
//
//  Created by Amer on 3/16/22.
//

import UIKit
import SnapKit
import PinLayout

public class CVView: UIView {
    private let pdfWidthInInches: CGFloat = 8.28
    private let pdfHeightInInches: CGFloat = 11.7
    private let pixelsPerInch: CGFloat = 72.0
    private let pdfWidth: CGFloat
    private let pdfHeight: CGFloat
    
    init() {
        pdfWidth = pixelsPerInch * pdfWidthInInches
        pdfHeight = pixelsPerInch * pdfHeightInInches
        super.init(frame: CGRect(x: 0, y: 0, width: pdfWidth, height: pdfHeight))
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let myNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Amer Eid"
        label.textColor = .black
        label.font = UIFont(name: "Lobster1.3", size: 28)
        return label
    }()
    
    let myEmailAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "amereid92@gmail.com"
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 12)
        return label
    }()
    
    let myPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "+971506832163"
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 12)
        return label
    }()
    
    let myAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Abu Dhabi, United Arab Emirates"
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 12)
        return label
    }()
    
    let myLinkedInProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "https://www.linkedin.com/in/amer-eid92/"
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 12)
        return label
    }()
    
    let myGitHubProfileLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "https://github.com/amereid"
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 12)
        return label
    }()
    
    private func setupViews() {
        
        
        createTopContainer()
        layout()
        
        for label in labelsArray {
            label.isHidden = true
        }
    }
    
    let topContainer = UIView()
    
    
    private func setup() {
        
    }
    
    private func layout() {
        topContainer.pin.top().start().end()
        myNameLabel.pin.sizeToFit().start().top()
        myEmailAddressLabel.pin.sizeToFit().top().end()
        myPhoneNumberLabel.pin.sizeToFit().below(of: myEmailAddressLabel).marginTop(10).end()
        myAddressLabel.pin.sizeToFit().below(of: myPhoneNumberLabel).marginTop(10).end()
        myLinkedInProfileLabel.pin.sizeToFit().below(of: myAddressLabel).marginTop(10).end()
        myGitHubProfileLabel.pin.sizeToFit().below(of: myLinkedInProfileLabel).marginTop(10).end()
        topContainer.pin.top().start().end().wrapContent(.vertically)
    }
    
    lazy var labelsArray: [UILabel] = [myNameLabel, myEmailAddressLabel, myPhoneNumberLabel, myAddressLabel, myLinkedInProfileLabel, myGitHubProfileLabel]
    
    private func createTopContainer() {
        topContainer.addSubview(myNameLabel)
        topContainer.addSubview(myEmailAddressLabel)
        topContainer.addSubview(myPhoneNumberLabel)
        topContainer.addSubview(myAddressLabel)
        topContainer.addSubview(myLinkedInProfileLabel)
        topContainer.addSubview(myGitHubProfileLabel)

        addSubview(topContainer)
        topContainer.backgroundColor = .red
    }
}
