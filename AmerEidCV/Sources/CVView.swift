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
    private let cvViewHeader = CVMainHeaderView()
    private let cvExperienceSectionHeaderView = CVSectionHeaderView(sectionHeaderTitle: "Experience")
    private let cvExperienceSubSectionHeaderView = CVSubSectionHeaderView(leftTitleString: "Lead iOS Engineer".basicTextAppearance(),
                                                                          leftSubtitleString: "Anghami".basicTextAppearance(),
                                                                          rightTitleString: "April 2020 - Present".basicTextAppearance(),
                                                                          rightSubtitleString: "Abu Dhabi, United Arab Emirates".basicTextAppearance())
    private let cvExperienceBulletPointView1 = CVBulletPointView(bulletPointString: "Anghami is the leading music streaming platform in the MENA region with over 80 million users".secondaryTextAppearance())
    private let cvExperienceBulletPointView2 = CVBulletPointView(bulletPointString: "Responsible for maintaining app performance by profiling using instruments in order to prevent memory leaks, main thread blockage, overuse of energy, and thread mismanagement".secondaryTextAppearance())
    
    
    
    private let models: [Any] = [PersonalDataModel(name: "Amer Eid",
                                                   phone: "+971506832163",
                                                   location: "Abu Dhabi, United Arab Emirates",
                                                   email: "amereid92@gmail.com",
                                                   githubURL: URL(string: "https://github.com/amereid")!,
                                                   linkedInURL: URL(string: "https://www.linkedin.com/in/amer-eid92/")!)]
    
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
            return CVViewFactory.getView(model: model)
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

class CVViewFactory {
    static func getView(model: Any) -> CVSubview? {
        switch model {
        case let personaDataModel as PersonalDataModel:
            return PersonalDataView()
        default:
            return nil
        }
    }
}
