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

    private let models: [Any] =
    [PersonalDataModel(name: "Amer Eid",
                       phone: "+971506832163",
                       location: "Abu Dhabi, United Arab Emirates",
                       email: "amereid92@gmail.com",
                       githubURL: URL(string: "https://github.com/amereid")!,
                       linkedInURL: URL(string: "https://www.linkedin.com/in/amer-eid92/")!),
     
     HeaderModel(title: "Experience"),
     
     DetailsModel(title: "Anghami",
                  subtitle: "Lead iOS Engineer",
                  date: "April 2020 - Present",
                  location: "Abu Dhabi, United Arab Emirates"),
     
     BulletPointModel(text: "Anghami is the leading music streaming platform in the MENA region with over 80 million users"),
     BulletPointModel(text: "Sole lead developer of the iOS platform which boasts a rating of 4.7 (700K ratings) on the App Store"),
     BulletPointModel(text: "Led development for core features such as the Audio Engine, Live Radios, Stories, In-App Purchases & Subscriptions, Chat, etc"),
     
     DetailsModel(title: "Parkr (Startup)",
                  subtitle: "Co-founder & CTO",
                  date: "June 2016 – June 2017",
                  location: "Beirut, Lebanon"),
     
     BulletPointModel(text: "Co-founded a parking app for emerging markets (www.weareparkr.com)"),
     BulletPointModel(text: "Pitched to multiple investors throughout and received 100,000 USD"),
     BulletPointModel(text: "Underwent acceleration in Beirut and San Francisco by Speed@BDD, AUBCRinn, LebNet Ignite, and French Tech Hub, encompassing all aspects of a tech entrepreneur"),
     BulletPointModel(text: "Conceptualized, sketched, and managed the development and release of the app and later features")]
    
    var labelsArray: [UILabel] =  []
    
    init() {
        pdfWidth = pixelsPerInch * pdfWidthInInches
        pdfHeight = pixelsPerInch * pdfHeightInInches
        super.init(frame: CGRect(x: 0, y: 0, width: pdfWidth, height: pdfHeight))
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        let cvSubviews: [CVSubview] = models.compactMap { model in
            return CVSubviewFactory.getView(model: model)
        }
        
        let pageSidePadding: CGFloat = 10
        
        var prevView: CVSubview?
        cvSubviews.forEach { cvSubview in
            self.addSubview(cvSubview)
            
            if let prevView = prevView {
                cvSubview.pin.horizontally(pageSidePadding)
                cvSubview.layout()
                cvSubview.pin.wrapContent(.vertically).horizontally(pageSidePadding).below(of: prevView).marginTop(5)
            } else {
                cvSubview.pin.top(pageSidePadding).horizontally(pageSidePadding)
                cvSubview.layout()
                cvSubview.pin.wrapContent(.vertically).top(pageSidePadding).horizontally(pageSidePadding)
            }
            labelsArray.append(contentsOf: cvSubview.labelsArray())
            cvSubview.hideLabels()
            prevView = cvSubview
        }
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
    
    func secondaryTextAppearance() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [.foregroundColor : UIColor.darkGray, .font: String.basicTextFont])
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
