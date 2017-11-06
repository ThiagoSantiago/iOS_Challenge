//
//  PlaylistDetailInteractor.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import Alamofire

class PlaylistDetailInteractor: PlaylistDetailInteractorInputProtocol {
    
    var presenter: PlaylistDetailInteractorOutputProtocol?
    
    func getPlaylistVideos(playlistId playListId: String) {
        GigigoApi.request(.getVideosByPlayList(playlistId: playListId, googleKey: Constants.apiKey)) { (result: Result<PlaylistVideos>) in
            switch result {
            case .success(let playlistVideos):
                self.presenter?.didRetrievePlaylistDetail(playlistVideos)
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
