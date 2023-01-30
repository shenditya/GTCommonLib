//
//  CustomButton.swift
//
//
//  Created by Shendy Aditya Syamsudin on 07/02/21.
//

import Foundation
import UIKit

@IBDesignable
public class CustomButton: UIButton {

    @IBInspectable var fontName: String = "Roboto-Medium" { didSet { updateView() }}
    @IBInspectable var fontSize: CGFloat = 16 { didSet { updateView() }}
    @IBInspectable var borderRadius: CGFloat = 10 { didSet { updateView() }}
    @IBInspectable public var giveBorder: Bool = false { didSet { updateView() }}
    @IBInspectable public var borderWidth: CGFloat = 1 { didSet { updateView() }}
    @IBInspectable public var borderColor: UIColor = UIColor.blue { didSet { updateView() }}
    @IBInspectable var isAllRounded: Bool = false { didSet { updateView() }}
    @IBInspectable var corners: UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight] { didSet { updateView() }}
    @IBInspectable public var shadowWidthOffset: CGFloat = 1{ didSet { updateView() }}
    @IBInspectable public var shadowHeightOffset: CGFloat = 3{ didSet { updateView() }}
    @IBInspectable public var shadowColor: UIColor =  UIColor.black{ didSet { updateView() }}
    @IBInspectable public var shadowRadius: CGFloat = 3{ didSet { updateView() }}
    @IBInspectable public var shadowOpacity: Float = 0.3{ didSet { updateView() }}
    @IBInspectable public var useShadow: Bool = false { didSet { updateView() }}
    
    func updateView() {
        titleLabel?.font = UIFont(name: fontName, size: fontSize)
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: borderRadius, height: borderRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        
        if giveBorder {
            layer.cornerRadius = borderRadius
            viewGiveBorder(borderWidth, borderColor)
        }
        
        if isAllRounded {
            layer.cornerRadius = frame.height / 2
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
