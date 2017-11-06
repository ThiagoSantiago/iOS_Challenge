//
//  VideoSnippet.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoSnippet: Mappable {
    
    var publishedAt: String?
    var channelId: String?
    var title: String?
    var description: String?
    var thumbnail: VideoThumbnail?
    var channelTitle: String?
    var playlistId: String?
    var position: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        publishedAt <- map["publishedAt"]
        channelId <- map["channelId"]
        title <- map["title"]
        description <- map["description"]
        thumbnail <- map["thumbnails"]
        channelTitle <- map["channelTitle"]
        playlistId <- map["playlistId"]
        position <- map["position"]
    }
}
