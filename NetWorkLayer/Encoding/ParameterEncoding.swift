//
//  ParameterEncoding.swift
//  NetWorkLayer
//
//  Created by Pham Kien on 19.07.20.
//  Copyright © 2020 Pham Kien. All rights reserved.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol PrameterEncoder {
    func encode(urlRequest:inout URLRequest,with parameters:Parameters) throws
    
}
public enum ParameterEncoding {
    
    case urlEncoding
    case jsonEncoding
    case urlAndJsonEncoding
    
    public func encode(urlRequest: inout URLRequest, bodyParameters:Parameters?,urlParameters:Parameters?) throws {
        
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = urlParameters else {return}
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            case .jsonEncoding:
                guard let bodyParameters = bodyParameters else {return}
                try JSOnParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            default: break
                
            }
        }
    }
}


public enum NetworkError:String,Error {
    case parameterNil = "Parameters were nil ."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
