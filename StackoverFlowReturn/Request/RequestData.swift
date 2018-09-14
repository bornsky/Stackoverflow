//
//  RequestData.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/13/18.
//  Copyright © 2018 John John. All rights reserved.
//

import Foundation

public struct RequestData {
    public let path: String
    public let method: HTTPMethod
    public let params: [String: Any?]?
    public let headers: [String: String]?
    
    public init (
        path: String,
        method: HTTPMethod = .get,
        params: [String: Any?]?,
        headers: [String: String]?
        ) {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
}
