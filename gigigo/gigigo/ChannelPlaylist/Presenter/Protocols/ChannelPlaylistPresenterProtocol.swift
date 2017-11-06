//
//  ChannelPlaylistPresenterProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

protocol ChannelPlaylistPresenterProtocol {
    var view: ChannelPalylistProtocol? { get set }
    var interactor: ChannelPlaylistInteractorInputProtocol? { get set }
    var wireFrame: ChannelPlaylistWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showPlaylist(playlist: Playlist)
}
