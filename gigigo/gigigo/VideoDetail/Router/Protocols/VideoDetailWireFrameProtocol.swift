//
//  VideoDetailWireFrameProtocol.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import UIKit

protocol VideoDetailWireFrameProtocol: class {
    static func createVideoDetailModule(forVideo video: Video) -> UIViewController
}
