//
//  VideoStandardThumbnail.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoStandardThumbnail: Mappable {
    var url: String?
    var width: String?
    var height: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        url <- map["url"]
        width <- map["width"]
        height <- map["width"]
    }
}
