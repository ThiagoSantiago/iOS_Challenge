//
//  PlaylistDetailInteractorOutputProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

protocol PlaylistDetailInteractorOutputProtocol {
    func didRetrievePlaylistDetail(_ playlistDetail: PlaylistVideos)
    func onError(_ error: GigigoApiError)
}
