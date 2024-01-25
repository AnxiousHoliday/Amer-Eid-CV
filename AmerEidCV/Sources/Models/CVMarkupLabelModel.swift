//
//  CVMarkupLabelModel.swift
//  AmerEidCV
//
//  Created by Amer Eid on 25/01/2024.
//

import UIKit

struct CVMarkupLabelModel {
    let text: String
    let font: UIFont
    let textColor: UIColor
    let linkColor: UIColor
    let textAlignment: NSTextAlignment
    let markupResults: [MarkupLinkData]
    
    init(
        text: String,
        font: UIFont = UIFont.p1FontRegular,
        textColor: UIColor = UIColor.black,
        linkColor: UIColor = UIColor.blueLinkColor,
        textAlignment: NSTextAlignment = .natural
    ) {
        self.font = font
        self.textColor = textColor
        self.linkColor = linkColor
        self.textAlignment = textAlignment
        (self.markupResults, self.text) = CVMarkup.parse(text)
    }
}
