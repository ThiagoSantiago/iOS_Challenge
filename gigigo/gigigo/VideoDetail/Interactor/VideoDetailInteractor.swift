//
//  VideoDetailInteractor.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import Alamofire

class VideoDetailInteractor: VideoDetailInteractorInputProtocol {
    var presenter: VideoDetailInteractorOutputProtocol?
    
    func getVideoDetails(videoId: String) {
        GigigoApi.request(.getInfoByVideo(videoId: videoId, googleKey: Constants.apiKey)) { (result: Result<VideoDetail>) in
            switch result {
            case .success(let videoDetail):
                self.presenter?.didRetrieveVideoDetail(videoDetail)
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
