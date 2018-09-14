//
//  ParameterEncoding.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/8/18.
//  Copyright © 2018 John John. All rights reserved.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterDecoder {
    static func decoder(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError: String, Error {
    
    case missingUrl = "Missing URL"
    case decodingFail = "Decoding Fail"
}
