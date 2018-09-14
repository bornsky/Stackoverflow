//
//  NetworkRouter.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/9/18.
//  Copyright © 2018 John John. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

associatedtype EndPoint : EndPointType

protocol NetworkRouter: class {
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    
    func cancel()
}
