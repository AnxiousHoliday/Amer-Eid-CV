//
//  BulletPointModel.swift
//  AmerEidCV
//
//  Created by Amer on 3/18/22.
//

import Foundation

enum BulletPointStyle {
    case normal, indented
}

struct BulletPointModel {
    let text: String
    var style: BulletPointStyle = .normal
}
