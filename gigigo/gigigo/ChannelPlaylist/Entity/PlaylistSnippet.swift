//
//  PlaylistSnippet.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class PlaylistSnippet: Mappable {
    
    var publishedAt: String?
    var channelId: String?
    var title: String?
    var description: String?
    var channelTitle: String?
    var thumbnail: PlaylistStandardThumbnail?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        publishedAt <- map["publishedAt"]
        channelId <- map["channelId"]
        title <- map["title"]
        description <- map["description"]
        channelTitle <- map["channelTitle"]
        thumbnail <- map["thumbnails"]
    }
    
}
