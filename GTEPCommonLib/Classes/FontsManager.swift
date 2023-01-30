//
//  FontsManager.swift
//
//
//  Created by Shendy Aditya Syamsudin on 28/05/21.
//  Copyright © 2021 Shendy Aditya Syamsudin. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    private class FontsManager {}
    
    static func loadFontWith(name: String) {
        let frameworkBundle = Bundle(for: FontsManager.self)
        let pathForResourceString = frameworkBundle.path(forResource: name, ofType: "ttf")
        let fontData = NSData(contentsOfFile: pathForResourceString!)
        let dataProvider = CGDataProvider(data: fontData!)
        let fontRef = CGFont(dataProvider!)
        var errorRef: Unmanaged<CFError>? = nil
        
        if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
            NSLog("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
        
    }
    
    public static func loadFontWithName(name: String, ofType: String, identifier: String? ) {
        if let identifier {
            let bundle = Bundle(identifier: identifier)
            if let pathForResourceString = bundle?.path(forResource: name, ofType: ofType) {
                let fontData = NSData(contentsOfFile: pathForResourceString)
                let dataProvider = CGDataProvider(data: fontData!)
                let fontRef = CGFont(dataProvider!)
                var errorRef: Unmanaged<CFError>? = nil
                
                if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
                    NSLog("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
                }
            }else {
                NSLog("Font \(name) Not Found - Please add font file to your project")
            }
        }else{
            NSLog("Bundle Identifier \(identifier) Not Found")
        }

    }
    
    public static let loadMyFonts: () = {
        loadFontWith(name: "Roboto-Bold")
        loadFontWith(name: "Roboto-Light")
        loadFontWith(name: "Roboto-Medium")
        loadFontWith(name: "Roboto-Regular")
      
    }()
}
