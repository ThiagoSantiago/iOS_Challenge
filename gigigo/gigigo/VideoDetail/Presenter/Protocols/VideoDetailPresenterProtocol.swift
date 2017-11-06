//
//  ViewDetailPresenterProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

protocol VideoDetailPresenterProtocol {
    
    var video: Video? { get set }
    var view: VideoDetailViewProtocol? { get set }
    var interactor: VideoDetailInteractorInputProtocol? { get set }
    var wireFrame: VideoDetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
}
