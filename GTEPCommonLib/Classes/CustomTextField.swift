//
//  CustomTextField.swift
//
//
//  Created by Shendy Aditya Syamsudin on 07/02/21.
//

import Foundation
import UIKit

@IBDesignable
public class CustomTextField: UITextField {
    
    @IBInspectable var fontSize: CGFloat = 16 { didSet { updateFonts() }}
    @IBInspectable var fontName: String = "Roboto-Medium" { didSet { updateFonts() }}
    @IBInspectable var canPerformCopyPaste: Bool = true {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    func updateFonts() {
        font = UIFont(name: fontName, size: fontSize)
    }
    

    public override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
            if action == #selector(UIResponderStandardEditActions.paste(_:))  || action == #selector(UIResponderStandardEditActions.copy(_:)) {
//                #if DEBUG
//                return true
//                #else
                //return canPerformCopyPaste
    //            #endif
                
                if canPerformCopyPaste {
                    return super.canPerformAction(action, withSender: sender)
                }else{
                    return false
                }
            }
            return super.canPerformAction(action, withSender: sender)
    }
}
