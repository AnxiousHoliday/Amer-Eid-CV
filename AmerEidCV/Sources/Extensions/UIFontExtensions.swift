//
//  UIFontExtensions.swift
//  AmerEidCV
//
//  Created by Amer on 3/27/22.
//

import UIKit

extension UIFont {
    private static let fontNameRegular = "OpenSans-Regular"
    private static let fontNameBold = "OpenSans-Bold"
    private static let fontNameItalic = "OpenSans-Italic"
    static let fontLobster = "Lobster1.3"
    
    static let h1FontRegular: UIFont = UIFont(name: fontNameRegular, size: 11) ?? UIFont.systemFont(ofSize: 11, weight: .regular)
    static let h1FontBold: UIFont = UIFont(name: fontNameBold, size: 11) ?? UIFont.systemFont(ofSize: 11, weight: .bold)
    
    static let p1FontRegular: UIFont = UIFont(name: fontNameRegular, size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)
    static let p1FontBold: UIFont = UIFont(name: fontNameBold, size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .bold)
    static let p1FontItalic: UIFont = UIFont(name: fontNameItalic, size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)
}
