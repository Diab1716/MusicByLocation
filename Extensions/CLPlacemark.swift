//
//  CLPlacemark.swift
//  MusicByLocation
//
//  Created by Diab, Ahmed (HWTA) on 27/02/2022.
//

import Foundation
import CoreLocation

extension CLPlacemark{
    func getLocationBreakdown()-> String{
        return
            """
            Street: \(self.thoroughfare ?? "None")
            City: \(self.locality ?? "None")
            Area: \(self.administrativeArea ?? "None")
            Country: \(self.country ?? "None")
            """
    }
}
