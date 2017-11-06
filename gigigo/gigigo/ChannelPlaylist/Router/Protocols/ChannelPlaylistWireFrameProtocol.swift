//
//  ChannelPlaylistWireFrameProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit

protocol ChannelPlaylistWireFrameProtocol {
    
    static func createChannelPlaylistModule() -> UIViewController
    
    func presentPlaylistDetailScreen(from view: ChannelPalylistProtocol, forPlaylist playlist: Playlist)
}
