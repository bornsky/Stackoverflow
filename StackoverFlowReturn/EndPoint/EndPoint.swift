//
//  Endpoint.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/8/18.
//  Copyright © 2018 John John. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseUrl: URL { get }
    var path: String { get  }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders { get }
}


