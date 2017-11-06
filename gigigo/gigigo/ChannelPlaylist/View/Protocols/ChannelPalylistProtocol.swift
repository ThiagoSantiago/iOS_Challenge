//
//  ChannelPalylistInterface.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

protocol ChannelPalylistProtocol: class {
    func showChanelPlaylists(playlists: [Playlist])
    func showLoading()
    func hideLoading()
    func showError()
}
