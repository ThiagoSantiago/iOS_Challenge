//
//  PlaylistDetailViewController.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import UIKit

class PlaylistDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playlistTitle: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    var presenter: PlaylistDetailPresenterProtocol?
    var playlistVideos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PlaylistDetailViewController: PlaylistDetailViewProtocol {
    func showPlaylistDetails(videos: [Video]) {
        playlistVideos = videos
        guard let snippet = playlistVideos[0].snippet else { return }
        playlistTitle.text = snippet.channelTitle
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

extension PlaylistDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistDetailCell", for: indexPath) as! PlaylistDatailTableViewCell
        
        let video = playlistVideos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showVideoInfo(video: playlistVideos[indexPath.row])
    }
}
