//
//  ProductEndPoint.swift
//  NetWorkLayer
//
//  Created by Pham Kien on 19.07.20.
//  Copyright © 2020 Pham Kien. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum ProductApi {
    case  sendRequest(id:Int)
}

extension ProductApi:EndPointType {
    var baseURL: URL {
        
    }
    
    var path: String {
        
    }
    
    
    
}

