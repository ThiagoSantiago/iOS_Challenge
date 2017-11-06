//
//  VideoThumbnails.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoThumbnail: Mappable {
    var standardThumbnail: VideoStandardThumbnail?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        standardThumbnail <- map["standard"]
    }
}
