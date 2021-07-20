//
//  Playlist.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/20/21.
//

import Foundation

class Playlist: Codable {
    
    let name: String
    var songs: [Song]
    let uuid: String
    
    internal init(name: String, songs: [Song] = [], uuid: String = UUID().uuidString) {
        self.name = name
        self.songs = songs
        self.uuid = uuid
    }
    
}//End Of Playlist

// MARK: - Extensions
extension Playlist: Equatable {
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
}//End Of Equatable Exyension
