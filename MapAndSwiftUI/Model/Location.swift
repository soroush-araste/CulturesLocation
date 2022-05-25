//
//  Location.swift
//  MapAndSwiftUI
//
//  Created by soroush amini araste on 5/23/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}


extension Location {
    var id: String {
        return name + cityName
    }
}
