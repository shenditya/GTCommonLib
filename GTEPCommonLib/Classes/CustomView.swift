//
//  CustomView.swift
//
//
//  Created by Shendy Aditya Syamsudin on 07/02/21.
//

import Foundation
import UIKit

@IBDesignable
public class CustomView: UIView {
    
    @IBInspectable public var shadowWidthOffset: CGFloat = 1{ didSet { updateView() }}
    @IBInspectable public var shadowHeightOffset: CGFloat = 3{ didSet { updateView() }}
    @IBInspectable public var shadowColor: UIColor =  UIColor.black{ didSet { updateView() }}
    @IBInspectable public var shadowRadius: CGFloat = 3{ didSet { updateView() }}
    @IBInspectable public var shadowOpacity: Float = 0.3{ didSet { updateView() }}
    @IBInspectable public var borderRadius: CGFloat = 10{ didSet { updateView() }}
    @IBInspectable public var useShadow: Bool = false { didSet { updateView() }}
    @IBInspectable public var isRoundedAllCorner: Bool = false { didSet { updateView() }}
    @IBInspectable public var giveBorder: Bool = false { didSet { updateView() }}
    @IBInspectable public var borderWidth: CGFloat = 1 { didSet { updateView() }}
    @IBInspectable public var borderColor: UIColor = UIColor.init(hexString: "EDEDED") { didSet { updateView() }}
    
    func updateView() {
        if giveBorder {
            viewGiveBorder(borderWidth, borderColor)
        }
        
        if isRoundedAllCorner {
            layer.cornerRadius = frame.height / 2
        } else {
            layer.cornerRadius = borderRadius
        }
        
        if useShadow {
            addShadow(CGSize(width: shadowWidthOffset, height: shadowHeightOffset), shadowColor, shadowRadius, shadowOpacity)
        }
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
}
