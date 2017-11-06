//
//  Video.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class Video: Mappable {
    
    var etag: String?
    var id: String?
    var snippet: VideoSnippet?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        etag <- map["etag"]
        id <- map["id"]
        snippet <- map["snippet"]
    }
}
