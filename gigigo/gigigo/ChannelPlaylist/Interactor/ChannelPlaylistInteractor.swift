//
//  VideoInteractor.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import Alamofire

class ChannelPlaylistInteractor: ChannelPlaylistInteractorInputProtocol {
    
    var presenter: ChannelPlaylistInteractorOutputProtocol?
    
    func getAllPlaylists() {
        typealias GetAllPlaylistsSuccess = (_ playlists: ChannelPlaylists?) -> Void
        GigigoApi.request(.getAllPlayList(idUser: Constants.userId, googleKey: Constants.apiKey)) { (result: Result<ChannelPlaylists>) in
            switch result {
            case .success(let playlists):
                self.presenter?.didRetrieveChannelPlaylist(playlists)
            case .failure(let error):
                guard let apiError = error as? GigigoApiError else {
                    self.presenter?.onError(GigigoApiError.unknownResponse)
                    return
                }
                self.presenter?.onError(apiError)
            }
        }
    }
}

