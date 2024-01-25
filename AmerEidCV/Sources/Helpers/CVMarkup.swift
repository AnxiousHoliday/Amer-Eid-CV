//
//  CVMarkup.swift
//  AmerEidCV
//
//  Created by Amer Eid on 25/01/2024.
//

import Foundation

typealias MarkupLinkData = (linkTextRange: Range<String.Index>, linkURL: String, linkText: String)

struct CVMarkup {
    /// Takes a string and parses the markup for links e.g "[Link Text](Link URL)"
    /// Returns an array of `MarkupLinkData` and the processed string which would look like -> "Link Text"
    /// The array of `MarkupLinkData` describes which part of the string is a hyperlink
    static func parse(_ string: String) -> ([MarkupLinkData], String) {
        var markupString = string
        typealias MarkupLinkRange = (
            startIndexBracket: String.Index,
            endIndexBracket: String.Index,
            startIndexParenthesis: String.Index,
            endIndexParenthesis: String.Index
        )
        var markupLinkRanges: [MarkupLinkRange] = []
        
        var startIndexBracket: Int?
        var endIndexBracket: Int?
        var startIndexParenthesis: Int?
        
        // We look over the characters to find patterns like this -> "[Link Text](Link URL)"
        for (index, char) in markupString.enumerated() {
            func resetVariables() {
                startIndexBracket = nil
                endIndexBracket = nil
                startIndexParenthesis = nil
            }
            
            if startIndexBracket != nil, endIndexBracket != nil, startIndexParenthesis != nil, char == ")" {
                let linkMarkupRange = MarkupLinkRange(
                    startIndexBracket: markupString.index(markupString.startIndex, offsetBy: startIndexBracket!),
                    endIndexBracket: markupString.index(markupString.startIndex, offsetBy: endIndexBracket!),
                    startIndexParenthesis: markupString.index(markupString.startIndex, offsetBy: startIndexParenthesis!),
                    endIndexParenthesis: markupString.index(markupString.startIndex, offsetBy: index)
                )
                markupLinkRanges.append(linkMarkupRange)
                resetVariables()
            } else if startIndexBracket != nil, startIndexBracket != nil, char == "(" {
                if index - endIndexBracket! > 1 {
                    resetVariables()
                } else {
                    startIndexParenthesis = index
                }
            } else if startIndexBracket != nil, char == "]" {
                endIndexBracket = index
            } else if char == "[" {
                startIndexBracket = index
            }
        }
        
        // If no markup patterns found, just return
        guard markupLinkRanges.count > 0 else {
            return ([], markupString)
        }
        
        typealias MarkupLinkInfo = (startIndexFromEnd: Int, endIndexFromEnd: Int, linkURL: String, linkText: String)
        
        // We loop over all the links and remove the link part and and the brackets to keep just the title
        // e.g "[Reddit](www.reddit.com)" -> "Reddit"
        // We keep track of the location of "Reddit" in the transformed string to use later on when specifying the link areas
        // while saving to a pdf.
        var markupLinkInfos: [MarkupLinkInfo] = []
        for markupLinkRange in markupLinkRanges.reversed() {
            let linkURL = markupString[markupString.index(after: markupLinkRange.startIndexParenthesis)...markupString.index(before: markupLinkRange.endIndexParenthesis)]
            let linkText = markupString[markupLinkRange.startIndexBracket...markupLinkRange.endIndexBracket]
            markupString.removeSubrange(markupLinkRange.endIndexBracket...markupLinkRange.endIndexParenthesis)
            markupString.remove(at: markupLinkRange.startIndexBracket)
   
            let endIndexFromEnd: String.Index
            /// This is added because if markupLinkRange.endIndexBracket is out of bounds, `markupString.index(before: markupLinkRange.endIndexBracket)` crashes even if the index before should be valid.
            if markupString.indices.contains(markupLinkRange.endIndexBracket) {
                endIndexFromEnd = markupString.index(before: markupLinkRange.endIndexBracket)
            } else {
                endIndexFromEnd = markupString.endIndex
            }
            let markupLinkInfo = MarkupLinkInfo(
                startIndexFromEnd: markupString.distance(from: markupString.endIndex, to: markupLinkRange.startIndexBracket),
                endIndexFromEnd: markupString.distance(from: markupString.endIndex, to: endIndexFromEnd),
                linkURL: String(linkURL),
                linkText: String(linkText)
            )
            markupLinkInfos.append(markupLinkInfo)
        }
        var finalResults: [MarkupLinkData] = []
        for markupLinkInfo in markupLinkInfos {
            let startIndex = markupString.index(markupString.endIndex, offsetBy: markupLinkInfo.startIndexFromEnd)
            let endIndex = markupString.index(markupString.endIndex, offsetBy: markupLinkInfo.endIndexFromEnd)
            let linkTextRange = startIndex..<endIndex
            let finalResult = (linkTextRange: linkTextRange, linkURL: markupLinkInfo.linkURL, linkText: markupLinkInfo.linkText)
            finalResults.append(finalResult)
        }
        return (finalResults, markupString)
    }
}
