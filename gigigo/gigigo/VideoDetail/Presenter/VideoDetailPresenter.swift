//
//  VideoDetailPresenter.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

class VideoDetailPresenter: VideoDetailPresenterProtocol {
    
    var video: Video?
    var view: VideoDetailViewProtocol?
    var interactor: VideoDetailInteractorInputProtocol?
    var wireFrame: VideoDetailWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.getVideoDetails(videoId: video?.id ?? "")
    }
}

extension VideoDetailPresenter: VideoDetailInteractorOutputProtocol {
    func didRetrieveVideoDetail(_ videoDetail: VideoDetail) {
        view?.hideLoading()
        let itens = videoDetail.items ?? []
        
        view?.showVideoDetails(videos: itens)
    }
    
    func onError(_ error: GigigoApiError) {
        view?.hideLoading()
        view?.showError()
    }
    
    
}
