//
//  ChannelPlaylistWireFrame.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit

class ChannelPlaylistWireFrame: ChannelPlaylistWireFrameProtocol {

    class func createChannelPlaylistModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ChannelPlaylistNavigationController")
        if let view = navController.childViewControllers.first as? ChannelPlaylistViewController {
            var presenter: ChannelPlaylistPresenterProtocol & ChannelPlaylistInteractorOutputProtocol = ChannelPlaylistPresenter()
            var interactor: ChannelPlaylistInteractorInputProtocol = ChannelPlaylistInteractor()
            let wireFrame: ChannelPlaylistWireFrameProtocol = ChannelPlaylistWireFrame()
            
            view.presenter = presenter as? ChannelPlaylistPresenterProtocol
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentPlaylistDetailScreen(from view: ChannelPalylistProtocol, forPlaylist playlist: Playlist) {
        let playlistDetailViewController = PlaylistDetailWireFrame.createPlaylistDetailModule(playlist: playlist)

        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(playlistDetailViewController, animated: true)
        }
    }
}
