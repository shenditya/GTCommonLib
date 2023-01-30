//
//  CustomMargin.swift
//
//
//  Created by Shendy Aditya Syamsudin on 07/02/21.
//
import Foundation
import UIKit

@IBDesignable
public class CustomMargin: NSLayoutConstraint {
    @IBInspectable var multi: Double = 0.5 { didSet { updateView() }}
    @IBInspectable var isThroughSafeArea: Bool = false { didSet { updateView() }}
    
    func updateView() {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            statusBarHeight = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        
        constant = (UIScreen.main.bounds.width * CGFloat(multi)) + (isThroughSafeArea ? statusBarHeight : 0)
    }
}
