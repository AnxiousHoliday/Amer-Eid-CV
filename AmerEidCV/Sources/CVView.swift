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
        let attributedString = NSMutableAttributedString()
        attributedString.append("Email ".secondaryBoldTextAppearance())
        attributedString.append("amereid92@gmail.com".basicTextAppearance())
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    let myPhoneNumberLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("Phone ".secondaryBoldTextAppearance())
        attributedString.append("+971506832163".basicTextAppearance())
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    let myAddressLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("Location ".secondaryBoldTextAppearance())
        attributedString.append("Abu Dhabi, United Arab Emirates".basicTextAppearance())
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    let myLinkedInProfileLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("LinkedIn ".secondaryBoldTextAppearance())
        attributedString.append("Press Me".basicLinkAppearance(link: URL(string: "https://www.linkedin.com/in/amer-eid92/")!))
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    let myGitHubProfileLabel: UILabel = {
        let attributedString = NSMutableAttributedString()
        attributedString.append("GitHub ".secondaryBoldTextAppearance())
        attributedString.append("Press Me".basicLinkAppearance(link: URL(string: "https://github.com/amereid")!))
        
        let label = UILabel()
        label.attributedText = attributedString
        return label
    }()
    
    private func setupViews() {
        createTopContainer()
        
        layout()
        
        for label in labelsArray {
            label.isHidden = true
        }
    }
    
    private let topContainer = UIView()
    
    private func layout() {
        topContainer.pin.top(10).horizontally(10)
        myNameLabel.pin.sizeToFit().start().top()
        myEmailAddressLabel.pin.sizeToFit().top().end()
        myPhoneNumberLabel.pin.sizeToFit().below(of: myEmailAddressLabel).marginTop(10).end()
        myAddressLabel.pin.sizeToFit().below(of: myPhoneNumberLabel).marginTop(10).end()
        myGitHubProfileLabel.pin.sizeToFit().below(of: myAddressLabel).marginTop(10).end()
        myLinkedInProfileLabel.pin.sizeToFit().before(of: myGitHubProfileLabel, aligned: .center).marginEnd(10)
        
        topContainer.pin.wrapContent(.vertically).top(10).horizontally(10)
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
//        topContainer.backgroundColor = .red
    }
}


extension String {
    fileprivate static let basicTextFont = UIFont(name: "Futura", size: 12) ?? .systemFont(ofSize: 12)
    fileprivate static let basicBoldTextFont = UIFont(name: "Futura-Bold", size: 12) ?? .systemFont(ofSize: 12, weight: .bold)
    
    func basicTextAppearance() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [.foregroundColor : UIColor.black, .font: String.basicTextFont])
    }
    
    func basicLinkAppearance(link: URL) -> NSAttributedString {
        return basicTextAppearance().link(link)
    }
    
    func secondaryBoldTextAppearance() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [.foregroundColor : UIColor.darkGray, .font: String.basicBoldTextFont])
    }
    
}

extension NSAttributedString {
    func apply(_ attributes: [NSAttributedString.Key:Any]) -> NSAttributedString {
        let mutable = NSMutableAttributedString(string: self.string, attributes: self.attributes(at: 0, effectiveRange: nil))
        mutable.addAttributes(attributes, range: NSMakeRange(0, (self.string as NSString).length))
        return mutable
    }
    
    func foregroundColor(_ color: UIColor) -> NSAttributedString {
        self.apply([.foregroundColor: color])
    }
    
    func background(_ color: UIColor) -> NSAttributedString {
        self.apply([.backgroundColor: color])
    }
    
    func underline(_ color: UIColor, style: NSUnderlineStyle = .single) -> NSAttributedString {
        self.apply([.underlineColor: color, .underlineStyle: style.rawValue])
    }
    
    func font(_ font: UIFont) -> NSAttributedString {
        self.apply([.font: font])
    }
    
    func shadow(_ shadow: NSShadow) -> NSAttributedString {
        self.apply([.shadow: shadow])
    }
    
    func link(_ link: URL) -> NSAttributedString {
        self.apply([.link: link])
    }
}
