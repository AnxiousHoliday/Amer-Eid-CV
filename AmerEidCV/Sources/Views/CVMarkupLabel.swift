//
//  CVMarkupLabel.swift
//  AmerEidCV
//
//  Created by Amer Eid on 25/01/2024.
//

import UIKit

class CVMarkupLabel: UIView {
    let label = UILabel()
    let markupResults: [MarkupLinkData]
    private let isTesting = false
    
    init(model: CVMarkupLabelModel) {
        label.numberOfLines = 0
        markupResults = model.markupResults
        let font = model.font
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = model.textAlignment
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: model.textColor,
            .paragraphStyle: paragraphStyle
        ]
        let attributedQuote = NSMutableAttributedString(string: model.text, attributes: attributes)
        for markupResult in markupResults {
            let range = markupResult.linkTextRange
            let nsrange = NSRange(range, in: model.text)
            attributedQuote.addAttribute(
                        .foregroundColor,
                        value: model.linkColor,
                        range: nsrange)
            attributedQuote.addAttribute(
                        .underlineStyle,
                        value: NSUnderlineStyle.thick.rawValue,
                        range: nsrange)
            attributedQuote.addAttribute(
                        .underlineColor,
                        value: model.linkColor,
                        range: nsrange)
        }
        label.attributedText = attributedQuote
        super.init(frame: .zero)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        addSubview(label)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isTesting {
            // Highlight blue areas where a link is pressable in the PDF
            for markupResult in markupResults {
                guard let attributedText = label.attributedText else { continue }
                let nsrange = NSRange(markupResult.linkTextRange, in: attributedText.string)
                guard let linkFrame = label.boundingRect(forCharacterRange: nsrange) else { continue }
                let newFrame = linkFrame.offsetBy(dx: label.frame.minX, dy: 0)
                let view = UIView(frame: newFrame)
                view.backgroundColor = .blue
                addSubview(view)
            }
        }
    }
}
