//
//  CVSubview.swift
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
