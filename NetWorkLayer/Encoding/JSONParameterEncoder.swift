//
//  JSONParameterEncoder.swift
//  NetWorkLayer
//
//  Created by Pham Kien on 19.07.20.
//  Copyright © 2020 Pham Kien. All rights reserved.
//

import Foundation


public struct JSOnParameterEncoder:PrameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData =  try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
            
        }
    }
    
    
    
}
