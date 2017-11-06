//
//  ChannelPlaylists.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class ChannelPlaylists: Mappable {
    
    var etag: String?
    var nextPageToken: String?
    var items: [Playlist]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        etag <- map["etag"]
        nextPageToken <- map["nextPageToken"]
        items <- map["items"]
    }
}
