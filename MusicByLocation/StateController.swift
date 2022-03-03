//
//  StateController.swift
//  MusicByLocation
//
//  Created by Diab, Ahmed (HWTA) on 27/02/2022.
//

import Foundation

class StateController: ObservableObject {
    @Published var lastKnownLocation: String = "" {
        didSet {
            iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsByLocation)
        }
    }
    @Published var artistsByLocation: String = ""
    let locationHandler: LocationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData(){
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsByLocation(artists: [Artist]?){
        let names = artists?.map { return $0.name }
        DispatchQueue.main.async{
        self.artistsByLocation = names?.joined(separator: ", ") ?? "Error finding artists from your location"
        }
    }
    
}
