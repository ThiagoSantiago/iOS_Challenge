//
//  ChannelPlaylistTableViewCell.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ChannelPlaylistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playlistThumbnail: UIImageView!
    @IBOutlet weak var playlistDescription: UILabel!
    @IBOutlet weak var playlistTitle: UILabel!
    
    func set(playlist: Playlist) {
        self.selectionStyle = .none
        
        guard let snippet = playlist.snippet else { return }
        
        playlistTitle.text = snippet.title
        playlistDescription.text = snippet.description
        
        guard let url = URL(string: snippet.thumbnail?.standardThumbnail?.url ?? "") else { return }
        let placeholderImage = UIImage(named: "placeholder")
        
        playlistThumbnail.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
