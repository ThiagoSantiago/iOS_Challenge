//
//  VideoDetailInteractorInputProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

protocol VideoDetailInteractorInputProtocol {
    var presenter: VideoDetailInteractorOutputProtocol? { get set }
    
    func getVideoDetails(videoId: String)
}
