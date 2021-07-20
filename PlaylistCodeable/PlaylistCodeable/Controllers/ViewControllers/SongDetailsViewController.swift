//
//  SongDetailsViewController.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/19/21.
//

import UIKit

class SongDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    // MARK: - Properties
    var song: Song?
    var playlist: Playlist?
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews(){
        guard let song = song else { return }
        songTitleTextField.text = song.songTitle
        artistTextField.text = song.artist
        
    }
    
    // MARK: - Properties
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        defer {
            navigationController?.popViewController(animated: true)
        }
        
        guard let songTitle = songTitleTextField.text, !songTitle.isEmpty,
              let artist = artistTextField.text, !songTitle.isEmpty,
              let playlist = playlist else { return }
        
        //if song is .some then update the song
        if let song = song {
            SongController.updateSong(song: song, newSongTitle: songTitle, newArtist: artist)
        } else { //if song is nil. add new song
            SongController.createSong(songTitel: songTitle, artist: artist, playlist: playlist)
        }

    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        songTitleTextField.text = ""
        artistTextField.text = ""
    }
    
    
    // MARK: - Functions

}
