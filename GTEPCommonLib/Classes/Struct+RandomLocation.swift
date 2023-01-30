//
//  Struct+RandomLocation.swift
//
//
//  Created by Shendy Aditya Syamsudin on 03/08/21.
//

import Foundation
import CoreLocation

public struct randomLocations {

    // create random locations (lat and long coordinates) around user's location
    public static func getMockLocationsFor(location: CLLocation, itemCount: Int) -> [CLLocation] {
        
        func getBase(number: Double) -> Double {
            return round(number * 1000)/1000
        }
        func randomCoordinate() -> Double {
            return Double(arc4random_uniform(140)) * 0.0001
        }
        
        let baseLatitude = getBase(number: location.coordinate.latitude - 0.007)
        // longitude is a little higher since I am not on equator, you can adjust or make dynamic
        let baseLongitude = getBase(number: location.coordinate.longitude - 0.008)
        
        var items = [CLLocation]()
        for _ in 0..<itemCount {
            
            let randomLat = baseLatitude + randomCoordinate()
            let randomLong = baseLongitude + randomCoordinate()
            let location = CLLocation(latitude: randomLat, longitude: randomLong)
            
            items.append(location)
            
        }
        
        return items
    }
}
