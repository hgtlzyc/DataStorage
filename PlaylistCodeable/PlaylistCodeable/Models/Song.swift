//
//  Song.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/19/21.
//

import Foundation

class Song: Codable {

    var songTitle: String
    var artist: String
    let date: Date
    let uuid: String
    
    init(songTitle: String,
         artist: String,
         uuid: String = UUID().uuidString,
         date: Date = Date() ) {
        self.songTitle = songTitle
        self.artist = artist
        self.uuid = uuid
        self.date = date
    }

    
}//End Of Song


// MARK: - Extensions
extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

