//
//  Bundle+Extension.swift
//
//
//  Created by Shendy Aditya Syamsudin on 26/07/21.
//

import Foundation


public extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var releaseVersionNumberPretty: String {
        return "\("VERSION".localize()) \(releaseVersionNumber ?? "1.0").\(buildVersionNumber ?? "1")"
    }
}
