//
//  SongColtroller.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/19/21.
//

import Foundation

class SongController {
        
    // MARK: - CRUD Functions
    func createSong(songTitel: String, artist: String, playlist: Playlist ) {
        let newSong = Song(songTitle: songTitel, artist: artist)
        playlist.songs.append(newSong)
    }
    
    func updateSong(song: Song, newSongTitle: String, newArtist: String) {
        song.songTitle = newSongTitle
        song.artist = newArtist
    }
    
    func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
    }
    
    // MARK: - Make init private
    private init(){}
    
}//End Of SongController
