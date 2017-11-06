//
//  ChannelPlaylistViewController.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit

class ChannelPlaylistViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    var presenter: ChannelPlaylistPresenterProtocol?
    var channelPlaylists: [Playlist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension ChannelPlaylistViewController: ChannelPalylistProtocol {
    
    func showChanelPlaylists(playlists: [Playlist]) {
        channelPlaylists = playlists
        guard let snippet = playlists[0].snippet else { return }
        channelTitle.text = snippet.channelTitle
        tableView.reloadData()
    }
    
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func hideLoading() {
        loadingView.isHidden = true
    }
    
    func showError() {
        let alert = UIAlertController(title: "Erro", message: "Ops, parece que ocorreu um erro, por favor tente novamente!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ChannelPlaylistViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelPlaylists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelPlaylistCell", for: indexPath) as! ChannelPlaylistTableViewCell
        
        let playlist = channelPlaylists[indexPath.row]
        cell.set(playlist: playlist)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showPlaylist(playlist: channelPlaylists[indexPath.row])
    }
}
