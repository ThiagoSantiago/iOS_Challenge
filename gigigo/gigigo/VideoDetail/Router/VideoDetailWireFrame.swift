//
//  VideoDetailWireFrame.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit

class VideoDetailWireFrame: VideoDetailWireFrameProtocol {
    
    class func createVideoDetailModule(forVideo video: Video) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "VideoDetailController")
        if let view = viewController as? VideoDetailViewController {
            var presenter: VideoDetailPresenterProtocol & VideoDetailInteractorOutputProtocol = VideoDetailPresenter()
            var interactor: VideoDetailInteractorInputProtocol = VideoDetailInteractor()
            let wireFrame: VideoDetailWireFrameProtocol = VideoDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.video = video
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
}
