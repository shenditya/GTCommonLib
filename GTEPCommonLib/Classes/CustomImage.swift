//
//  CustomImage.swift

//
//  Created by Shendy Aditya Syamsudin on 07/02/21.
//

import Foundation
import UIKit

@IBDesignable
public class CustomImage: UIImageView {
    
    @IBInspectable var borderRadius: CGFloat = 10 { didSet { updateView() }}
    @IBInspectable var corners: UIRectCorner = [] { didSet { updateView() }}
    @IBInspectable var isCircle: Bool = false { didSet { updateView() }}
    
    func updateView() {
        if isCircle {
            clipsToBounds = true
            layer.cornerRadius = frame.size.height / 2
        } else {
            if corners.isEmpty {
                clipsToBounds = true
                layer.cornerRadius = borderRadius
            } else {
                let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: borderRadius, height: borderRadius))
                let mask = CAShapeLayer()
                mask.path = path.cgPath
                layer.mask = mask
            }
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
}
