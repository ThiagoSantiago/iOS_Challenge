//
//  GigigoApi.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 03/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

enum GigigoApi {
    case getAllPlayList(idUser: String, googleKey: String)
    case getVideosByPlayList(playlistId: String, googleKey: String)
    case getInfoByVideo(videoId: String, googleKey: String)
}

extension GigigoApi {
    
    var baseUrl: String {
        return Constants.baseUrl
    }
    
    var path: String {
        switch self {
        case .getAllPlayList(let idUser, let googleKey):
            return "/youtube/v3/playlists?part=snippet&channelId=\(idUser)&key=\(googleKey)"
        case .getVideosByPlayList(let playlistId, let googleKey):
            return "/youtube/v3/playlistItems?part=snippet&playlistId=\(playlistId)&key=\(googleKey)"
        case .getInfoByVideo(let videoId, let googleKey):
            return "/youtube/v3/videos?id=\(videoId)&part=snippet&key=\(googleKey)"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        
        switch self {
        case .getAllPlayList(_, _), .getVideosByPlayList(_, _), .getInfoByVideo(_, _):
            return .get
        default:
            return .post
        }
    }
    
    var parameters: Parameters {
        switch self {
        default:
            return [:]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case _ where self.method == .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var headers: Alamofire.HTTPHeaders {
        var defaultHeaders = [String: String]()
        
        switch self {
        default:
            defaultHeaders["Content-Type"] = "application/json"
            return defaultHeaders
        }
    }
}

extension GigigoApi {
    
    static func request<T: Mappable>(_ endpoint: GigigoApi, completion: @escaping (_ result: Result<T>) -> Void) {
        
        Alamofire.request("\(endpoint.baseUrl)\(endpoint.path)", method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.encoding, headers: endpoint.headers).responseJSON { (httpResponse: DataResponse<Any>) in
            
            print("response: \(httpResponse.response)")
            print("response status code: \(httpResponse.response?.statusCode)")
            print("response result value: \(httpResponse.result.value)")
            
            guard let response = httpResponse.response else {
                completion(Result.failure(GigigoApiError.unknownResponse))
                return
            }
            
            completion(self.handler(statusCode: response.statusCode, dataResponse: httpResponse))
        }
    }
    
    private static func handler<T: Mappable>(statusCode: Int, dataResponse: DataResponse<Any>) -> Result<T> {
        
        switch statusCode {
        case 200...299:
            let responseJson = dataResponse.result.value as? [String: Any]
            
            return parseJson(responseJson)
        case 400:
            return Result.failure(GigigoApiError.badRequest)
        case 401:
            return Result.failure(GigigoApiError.unauthorized)
        case 404:
            return Result.failure(GigigoApiError.notFound)
        default:
            return Result.failure(GigigoApiError.unknownResponse)
        }
    }
    
    private static func parseJson<T: Mappable>(_ responseJson: [String: Any]?) -> Result<T> {
        
        if let json = responseJson {
            guard let object = T(JSON: json) else {
                return Result.failure(GigigoApiError.invalidJson)
            }
            
            return Result.success(object)
        } else {
            guard let object = T(JSON: responseJson ?? [:]) else {
                return Result.failure(GigigoApiError.invalidJson)
            }
            
            return Result.success(object)
        }
    }
}
