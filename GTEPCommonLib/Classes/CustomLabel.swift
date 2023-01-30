//
//  CustomLabel.swift
//
//
//
import Foundation
import UIKit

@IBDesignable
public class CustomLabel: UILabel {
    
    @IBInspectable var fontName: String = "Roboto-Medium" { didSet { updateFonts() }}
    @IBInspectable var fontSize: CGFloat = 16 { didSet { updateFonts() }}

    
    func updateFonts() {
        font = UIFont(name: fontName, size: fontSize)
    }
    
    
    override public var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

     
}
