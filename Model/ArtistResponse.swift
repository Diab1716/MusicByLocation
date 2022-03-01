//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Diab, Ahmed (HWTA) on 27/02/2022.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum codingKeys: String, CodingKey {
        case count = "resultCount"
        case result
    }
}
