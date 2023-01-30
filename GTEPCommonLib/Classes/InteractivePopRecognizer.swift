//
//  InteractivePopRecognizer.swift
//
//
//  Created by Shendy Aditya Syamsudin on 15/06/21.
//
//

import Foundation
import UIKit

public class InteractivePopRecognizer: NSObject, UIGestureRecognizerDelegate {
    
    public var navigationController: UINavigationController
    
    public init(controller: UINavigationController) {
        self.navigationController = controller
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController.viewControllers.count > 1
    }
    
    // This is necessary because without it, subviews of your top controller can
    // cancel out your gesture recognizer on the edge.
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
