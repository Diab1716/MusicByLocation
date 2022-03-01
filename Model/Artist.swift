//
//  Artist.swift
//  MusicByLocation
//
//  Created by Diab, Ahmed (HWTA) on 27/02/2022.
//

import Foundation

struct Artist: Codable {
    var name: String
    
    private enum codingKeys: String, CodingKey {
        case name = "artistName"
    }
}
