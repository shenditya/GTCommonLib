//
//  CustomTextView.swift
//
//
//  Created by Shendy Aditya Syamsudin on 07/02/21.
//

import Foundation
import UIKit

@IBDesignable
public class CustomTextView: UITextView {
    
    @IBInspectable var fontSize: CGFloat = 16 { didSet { updateFonts() }}
    @IBInspectable var fontName: String = "Roboto-Medium" { didSet { updateFonts() }}
    
    func updateFonts() {
        font = UIFont(name: fontName, size: fontSize)
    }
}

public extension UITextView {
    
    func hyperLink(originalText: String, linkTextsAndTypes: [String: String]) {
        
        let style = NSMutableParagraphStyle()
        style.alignment = .left
        
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        
        for linkTextAndType in linkTextsAndTypes {
            let linkRange = attributedOriginalText.mutableString.range(of: linkTextAndType.key)
            let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
            attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: linkTextAndType.value, range: linkRange)
            attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
        }
        
        self.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gtBlue,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ] as [NSAttributedString.Key: Any]
        
        self.attributedText = attributedOriginalText
    }
}
