//
//  PlaylistThumbnail.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class PlaylistThumbnail: Mappable {
    var url: String?
    var width: Int?
    var height: Int?

    required init?(map: Map) {}
    
    func mapping(map: Map) {
        url <- map["url"]
        width <- map["width"]
        height <- map["height"]
    }
}
