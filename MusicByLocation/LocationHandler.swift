//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Diab, Ahmed (HWTA) on 25/02/2022.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    @Published var lastKnownLocation: String = ""
    @Published var lastKnownSpecificLocation: String = ""
    @Published var lastKnownPostcode: String = ""
    @Published var areasOfInterest: String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
        
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.lastKnownLocation = "Could not perform lookup of location from coordinate information"
                    self.lastKnownSpecificLocation = "Could not perform lookup of specfic location from coordinate information "
                    self.lastKnownPostcode = "Could not perform lookup of postcode from coordinate information"
                    self.areasOfInterest = "Could not perform lookup of areas of interest from coordinate information"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.lastKnownLocation = firstPlacemark.locality ?? "Couldn't find location"
                        self.lastKnownSpecificLocation = firstPlacemark.subLocality ?? "Couldn't find extra city information"
                        self.lastKnownPostcode = firstPlacemark.postalCode ?? "Couldn't find postcode"
                        self.lastKnownPostcode = (firstPlacemark.areasOfInterest![0]) ?? "Couldnt find area of interest"
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        lastKnownLocation = "Error finding location"
    }
}
