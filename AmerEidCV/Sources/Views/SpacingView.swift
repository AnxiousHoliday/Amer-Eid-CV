//
//  SpacingView.swift
//  AmerEidCV
//
//  Created by Amer Eid on 24/01/2024.
//

import Foundation

class SpacingView: CVSubview {
    init(model: SpacingModel) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: model.height))
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        layout()
    }
    
    override func layout() {
        pin.horizontally()
    }
}
