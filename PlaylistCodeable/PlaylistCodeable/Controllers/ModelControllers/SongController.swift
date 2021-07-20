//
//  SongColtroller.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/19/21.
//

import Foundation

class SongController {
        
    // MARK: - CRUD Functions
    static func createSong(songTitel: String, artist: String, playlist: Playlist ) {
        let newSong = Song(songTitle: songTitel, artist: artist)
        playlist.songs.append(newSong)
        
        PlaylistController.shared.saveToPersistanceStore()
    }
    
    static func updateSong(song: Song, newSongTitle: String, newArtist: String) {
        song.songTitle = newSongTitle
        song.artist = newArtist
        
        PlaylistController.shared.saveToPersistanceStore()
    }
    
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        
        PlaylistController.shared.saveToPersistanceStore()
    }
    
    // MARK: - Make init private
    private init(){}
    
}//End Of SongController
