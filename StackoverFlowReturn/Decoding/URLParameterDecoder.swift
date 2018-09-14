//
//  URLParameterEncoder.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/8/18.
//  Copyright © 2018 John John. All rights reserved.
//

import Foundation

public struct URLParameterDecoder: ParameterDecoder {
    public static func decoder(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingUrl }
        
    if var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
        
            urlComponent.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            
                let queryItems = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            
            urlComponent.queryItems?.append(queryItems)
            }
            urlRequest.url = urlComponent.url
        }
    
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; character=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}

