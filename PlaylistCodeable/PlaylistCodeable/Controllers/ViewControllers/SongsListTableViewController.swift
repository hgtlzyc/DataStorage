//
//  SongsListTableViewController.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/19/21.
//

import UIKit

class SongsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func addSongButtonTapped(_ sender: Any) {
        presetAddSongAlert()
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongController.shared.songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        let song = SongController.shared.songs[indexPath.row]
        
        cell.textLabel?.text = song.songTitle
        cell.detailTextLabel?.text = song.artist
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let songToDelete = SongController.shared.songs[indexPath.row]
            SongController.shared.deleteSong(song: songToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Methods
    func presetAddSongAlert() {
        let alert = UIAlertController(title: "Add Song", message: "wubba", preferredStyle: .alert)
       
        alert.addTextField { songNameTextField in
            songNameTextField.placeholder = "song name"
            
        }
        
        alert.addTextField { artistTextField in
            artistTextField.placeholder = "artist..."
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let songName = alert.textFields![0].text,
                  let artist = alert.textFields![1].text else { return }
            
            SongController.shared.createSong(songTitel: songName, artist: artist)
            self.tableView.reloadData()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
    }
}
