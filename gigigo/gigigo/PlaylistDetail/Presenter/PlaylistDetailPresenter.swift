//
//  PlaylistDetailPresenter.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

class PlaylistDetailPresenter: PlaylistDetailPresenterProtocol {
    var playlist: Playlist?
    var view: PlaylistDetailViewProtocol?
    var interactor: PlaylistDetailInteractorInputProtocol?
    var wireFrame: PlaylistDetailWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.getPlaylistVideos(playlistId: playlist?.id ?? "")
    }
    
    func showVideoInfo(video: Video) {
        wireFrame?.presentVideoInfoScreen(from: view!, forVideo: video)
    }
}

extension PlaylistDetailPresenter: PlaylistDetailInteractorOutputProtocol {
    func didRetrievePlaylistDetail(_ playlistDetail: PlaylistVideos) {
        view?.hideLoading()
        let playlistItens = playlistDetail.videos ?? []
        
        view?.showPlaylistDetails(videos: playlistItens)
    }
    
    func onError(_ error: GigigoApiError) {
        view?.hideLoading()
        view?.showError()
    }
    
    
}
