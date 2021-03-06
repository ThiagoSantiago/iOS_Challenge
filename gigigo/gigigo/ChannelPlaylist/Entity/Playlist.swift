//
//  Playlist.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class Playlist: Mappable {
    var etag: String?
    var id: String?
    var snippet: PlaylistSnippet?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        etag <- map["etag"]
        id <- map["id"]
        snippet <- map["snippet"]
    }
}
