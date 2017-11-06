//
//  PlaylistDetailWireFrameProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit

protocol PlaylistDetailWireFrameProtocol {
    
    static func createPlaylistDetailModule(playlist: Playlist) -> UIViewController
    
    func presentVideoInfoScreen(from view: PlaylistDetailViewProtocol, forVideo video: Video)
}
