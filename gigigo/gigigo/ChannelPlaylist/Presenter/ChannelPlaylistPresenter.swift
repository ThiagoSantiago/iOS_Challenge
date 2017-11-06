//
//  ChannelPlaylistPresenter.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

class ChannelPlaylistPresenter: ChannelPlaylistPresenterProtocol {
    var view: ChannelPalylistProtocol?
    var interactor: ChannelPlaylistInteractorInputProtocol?
    var wireFrame: ChannelPlaylistWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.getAllPlaylists()
    }
    
    func showPlaylist(playlist: Playlist) {
        wireFrame?.presentPlaylistDetailScreen(from: view!, forPlaylist: playlist)
    }
}

extension ChannelPlaylistPresenter: ChannelPlaylistInteractorOutputProtocol {
    func didRetrieveChannelPlaylist(_ channelPlaylist: ChannelPlaylists) {
        view?.hideLoading()
        let playlistItens = channelPlaylist.items ?? []

        view?.showChanelPlaylists(playlists: playlistItens)
    }
    
    func onError(_ error: GigigoApiError) {
        view?.hideLoading()
        view?.showError()
    }
}
