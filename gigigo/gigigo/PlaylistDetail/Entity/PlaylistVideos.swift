//
//  PlaylistVideos.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class PlaylistVideos: Mappable {
    
    var etag: String?
    var nextPageToken: String?
    var videos: [Video]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        etag <- map["etag"]
        nextPageToken <- map["nextPageToken"]
        videos <- map["items"]
    }
}
