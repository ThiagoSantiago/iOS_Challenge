//
//  GigigoApiError.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 04/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation

enum GigigoApiError: Error {
    
    case badRequest
    case notFound
    case unauthorized
    case unknownResponse
    case invalidJson
    case noInternet
    case erro500
}
