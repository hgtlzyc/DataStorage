//
//  SongColtroller.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/19/21.
//

import Foundation

class SongController {
    
    // MARK: - Properties
    static let shared = SongController()
    
    var songs: [Song] = []
    
    // MARK: - CRUD Functions
    func createSong(songTitel: String, artist: String ) {
        let newSong = Song(songTitle: songTitel, artist: artist)
        songs.append(newSong)
    }
    
    func deleteSong(song: Song) {
        guard let index = songs.firstIndex(of: song) else { return }
        songs.remove(at: index)
    }
    
    // MARK: - Make init private
    private init(){}
    
}//End Of SongController
