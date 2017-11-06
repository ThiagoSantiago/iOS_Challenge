//
//  PlaylistDetailWireFrame.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit

class PlaylistDetailWireFrame: PlaylistDetailWireFrameProtocol {

    static func createPlaylistDetailModule(playlist: Playlist) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PlaylistDetailController")
        if let view = viewController as? PlaylistDetailViewController {
            var presenter: PlaylistDetailPresenterProtocol & PlaylistDetailInteractorOutputProtocol = PlaylistDetailPresenter()
            var interactor: PlaylistDetailInteractorInputProtocol = PlaylistDetailInteractor()
            let wireFrame: PlaylistDetailWireFrameProtocol = PlaylistDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.playlist = playlist
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentVideoInfoScreen(from view: PlaylistDetailViewProtocol, forVideo video: Video) {
        let videoDetailViewController = VideoDetailWireFrame.createVideoDetailModule(forVideo: video)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(videoDetailViewController, animated: true)
        }
    }
}
