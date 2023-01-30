//
//  Date+Extension.swift
//
//
//  Created by Shendy Aditya Syamsudin on 04/08/22.
//
//

import Foundation

public extension Date {
    func utcToLocalDate() -> Date {
        let secondsOffset = Double(TimeZone.current.secondsFromGMT(for: self))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(secondsOffset), to: self) else {return Date()}
        return localDate
    }
}
