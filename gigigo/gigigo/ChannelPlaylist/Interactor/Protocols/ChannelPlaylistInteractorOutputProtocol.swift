//
//  ChannelPlaylistInteractorOutputProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

protocol ChannelPlaylistInteractorOutputProtocol {
    func didRetrieveChannelPlaylist(_ channelPlaylist: ChannelPlaylists)
    func onError(_ error: GigigoApiError)
}
