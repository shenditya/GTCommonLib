//
//  CustomTabbarView.swift
//
//
//  Created by Shendy Aditya Syamsudin on 18/06/21.
//

import Foundation

import UIKit

@IBDesignable
public final class CustomTabbarView: UITabBar {
    
    @objc public var centerButtonActionHandler: ()-> () = {}

    @IBInspectable public var centerButtonColor: UIColor?
    @IBInspectable public var selectedButtonColor: UIColor?
    @IBInspectable public var centerButtonHeight: CGFloat = 65
    @IBInspectable public var centerImageHeight: CGFloat = 20
    @IBInspectable public var padding: CGFloat = 5.0
    @IBInspectable public var titleSize: CGFloat = 10
    @IBInspectable public var titleFontName: String = "Roboto-Bold"
    @IBInspectable public var buttonImage: UIImage?
    @IBInspectable public var giveBorder: Bool = false
    @IBInspectable public var borderColor: UIColor?
    @IBInspectable public var borderSize: CGFloat = 1
    @IBInspectable public var giveShadow: Bool = false
    
    @IBInspectable public var buttonTitle: String?
    @IBInspectable public var buttonMarginBottom: CGFloat = -28
    @IBInspectable public var tabbarColor: UIColor = UIColor.white
    @IBInspectable public var unselectedItemColor: UIColor = UIColor.gray

    private var shapeLayer: CALayer?
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = tabbarColor.cgColor
        shapeLayer.lineWidth = 0
        
        //The below 4 lines are for shadow above the bar. you can skip them if you do not want a shadow
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 1
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.3
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
        self.unselectedItemTintColor = unselectedItemColor
        
        self.setupMiddleButton()
    }
    
    override public func draw(_ rect: CGRect) {
        self.addShape()
    }
        
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
    
    private func createPath() -> CGPath {
        let f = CGFloat(centerButtonHeight / 2.0) + padding
        let h = frame.height
        let w = frame.width
        let halfW = frame.width/2.0
        let r = CGFloat(10)
        let path = UIBezierPath()
        path.move(to: .zero)
        
        path.addLine(to: CGPoint(x: halfW-f-(r/2.0), y: 0))
        
        path.addQuadCurve(to: CGPoint(x: halfW-f, y: (r/2.0)), controlPoint: CGPoint(x: halfW-f, y: 0))
        
        path.addArc(withCenter: CGPoint(x: halfW, y: (r/2.0)), radius: f, startAngle: .pi, endAngle: 0, clockwise: false)
        
        path.addQuadCurve(to: CGPoint(x: halfW+f+(r/2.0), y: 0), controlPoint: CGPoint(x: halfW+f, y: 0))
        
        path.addLine(to: CGPoint(x: w, y: 0))
        path.addLine(to: CGPoint(x: w, y: h))
        path.addLine(to: CGPoint(x: 0.0, y: h))
        
        return path.cgPath
    }
    
    private func setupMiddleButton() {
        
        let centerButton = CustomView(frame: CGRect(x: (self.bounds.width / 2)-(centerButtonHeight/2), y: buttonMarginBottom, width: centerButtonHeight, height: centerButtonHeight))
        
        let imageCenterButton = UIImageView(frame: CGRect(x: centerButton.bounds.height/2 - centerImageHeight/2, y: centerButton.bounds.height/2 - centerImageHeight/2 - 10, width: centerImageHeight, height: centerImageHeight))
        
        let titleCenterButton = CustomLabel(frame:  CGRect(x: centerButton.bounds.minX + 2, y: centerButton.bounds.height/2 + 2 , width: centerButtonHeight - 5, height: centerImageHeight))
        
        imageCenterButton.image = buttonImage
        imageCenterButton.image = imageCenterButton.image?.withRenderingMode(.alwaysTemplate)
        imageCenterButton.tintColor = selectedButtonColor
        
        titleCenterButton.text = buttonTitle
        titleCenterButton.textAlignment = .center
        titleCenterButton.fontSize = titleSize
        titleCenterButton.fontName = titleFontName
        titleCenterButton.textColor = selectedButtonColor
    
        centerButton.giveBorder = giveBorder
        centerButton.useShadow = giveShadow
        centerButton.shadowWidthOffset = 0
        centerButton.shadowHeightOffset = -1
        centerButton.shadowOpacity = 0.1
        centerButton.shadowRadius = 1
        centerButton.shadowColor = UIColor.gray
        centerButton.borderWidth = borderSize
        centerButton.isRoundedAllCorner = true
        centerButton.backgroundColor = centerButtonColor

        //add to the tabbar and add click event
        centerButton.addSubview(imageCenterButton)
        centerButton.addSubview(titleCenterButton)
        
        self.addSubview(centerButton)
        
        centerButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(centerButtonAction)))
    }
    
    // Menu Button Touch Action
     @objc func centerButtonAction(sender: UIButton) {
        
        self.centerButtonActionHandler()
     }
}



extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
