//
//  PlaylistDetailPresenterProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

protocol PlaylistDetailPresenterProtocol {
    
    var playlist: Playlist? { get set }
    var view: PlaylistDetailViewProtocol? { get set }
    var interactor: PlaylistDetailInteractorInputProtocol? { get set }
    var wireFrame: PlaylistDetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showVideoInfo(video: Video)
}

