//
//  PlaylistController.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/20/21.
//

import Foundation

class PlaylistController {
    // MARK: - Properties
    static let shared = PlaylistController()
    
    var playlists: [Playlist] = []
    
    // MARK: - Functions
    func createPlaylist(name: String) {
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
        saveToPersistanceStore()
    }
    
    func deletePlaylist(playList: Playlist) {
        guard let index = playlists.firstIndex(of: playList) else { return }
        playlists.remove(at: index)
        saveToPersistanceStore()
    }
    
    
    // MARK: - Persistence
        
    private func getPersistenceURL() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Playlist.json")
        return fileURL
    }
    
    func saveToPersistanceStore() {
        do {
            let data = try JSONEncoder().encode(playlists)
            try data.write(to: getPersistenceURL())
        } catch let e {
            print(e)
        }
    }
    
    func loadFromPeristenceStore() {
        do {
            let data = try Data(contentsOf: getPersistenceURL())
            playlists = try JSONDecoder().decode([Playlist].self, from: data)
        } catch let e {
            print(e)
        }
    }
    
    
}//End Of PlaylistController
