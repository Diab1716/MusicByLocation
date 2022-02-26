//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Diab, Ahmed (HWTA) on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationHandler = LocationHandler()
    
    var body: some View {
        VStack {
            Text("City: \(locationHandler.lastKnownLocation)")
            Text("Area: \(locationHandler.lastKnownSpecificLocation)")
            Text("Postcode: \(locationHandler.lastKnownPostcode)")
            Text("Areas of Interest: \(locationHandler.areasOfInterest)")
            Spacer()
            Button("Find Music", action: {locationHandler.requestLocation()})
        }.onAppear(perform: {
            locationHandler.requestAuthorisation()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
