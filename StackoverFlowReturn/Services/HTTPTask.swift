//
//  HTTPTask.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/8/18.
//  Copyright © 2018 John John. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String : String]

public enum HTTPTask {
    
    case request
    
    case requestParameters(bodyParameter: Parameters?, urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameter: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?)
}
