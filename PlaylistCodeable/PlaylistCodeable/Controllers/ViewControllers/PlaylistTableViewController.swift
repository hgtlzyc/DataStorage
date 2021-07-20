//
//  PlaylistTableViewController.swift
//  PlaylistCodeable
//
//  Created by lijia xu on 7/20/21.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        PlaylistController.shared.loadFromPeristenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        presentNewPlaylistAlert()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.shared.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)

        // Configure the cell...
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        
        cell.detailTextLabel?.text = playlist.songs.count == 1 ? "1 Song" : "\(playlist.songs.count)"
        
//        if playlist.songs.count == 1 {
//            cell.detailTextLabel?.text = "1 Song"
//        } else {
//            cell.detailTextLabel?.text = "\(playlist.songs.count)"
//        }
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let playlistToDelete = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.deletePlaylist(playList: playlistToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Methods
    
    func presentNewPlaylistAlert() {
        let alert = UIAlertController(title: "New Playlist", message: "enter new playlist name", preferredStyle: .alert)
        
        alert.addTextField { nameTF in
            nameTF.placeholder = "playlist name ..."
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "add", style: .default) { _ in
            guard let playlistName = alert.textFields?[0].text, !playlistName.isEmpty else { return }
            PlaylistController.shared.createPlaylist(name: playlistName)
            self.tableView.reloadData()
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSongsListVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? SongsListTableViewController else { return }
            
            let playlistToSend = PlaylistController.shared.playlists[indexPath.row]
            
            destinationVC.playlist = playlistToSend
        }
    }

}//End Of VC
