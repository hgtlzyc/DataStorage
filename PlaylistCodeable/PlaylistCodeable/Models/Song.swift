//
//  Song.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/19/21.
//

import Foundation

class Song {

    let songTitle: String
    let artist: String
    let uuid: String
    
    init(songTitle: String,
         artist: String,
         uuid: String = UUID().uuidString) {
        self.songTitle = songTitle
        self.artist = artist
        self.uuid = uuid
    }

    
}//End Of Song


// MARK: - Extensions
extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
