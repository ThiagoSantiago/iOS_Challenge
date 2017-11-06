//
//  PlaylistDetailTableViewCell.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit

class PlaylistDatailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playlistThumbnail: UIImageView!
    @IBOutlet weak var playlistDescription: UILabel!
    @IBOutlet weak var playlistTitle: UILabel!
    
    func set(video: Video) {
        self.selectionStyle = .none
        
        guard let snippet = video.snippet else { return }
        
        playlistTitle.text = snippet.title
        playlistDescription.text = snippet.description
        
        guard let url = URL(string: snippet.thumbnail?.standardThumbnail?.url ?? "") else { return }
        let placeholderImage = UIImage(named: "placeholder")
        
        playlistThumbnail.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
