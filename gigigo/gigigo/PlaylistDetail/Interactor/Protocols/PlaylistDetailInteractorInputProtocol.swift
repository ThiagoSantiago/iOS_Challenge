//
//  PlaylistDetailInteractorInputProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

protocol PlaylistDetailInteractorInputProtocol {
    var presenter: PlaylistDetailInteractorOutputProtocol? { get set }
    
    func getPlaylistVideos(playlistId: String)
}
