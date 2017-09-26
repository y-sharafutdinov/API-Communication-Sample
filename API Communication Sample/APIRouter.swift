//
//  APIRouter.swift
//  API Communication Sample
//
//  Created by Yaroslav Sharafutdinov on 8/9/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case scores
    case audienceValues
    case audienceGrowth
    case demographicsAge
    case demographicsGender
    
    static let baseURLString = "https://api.myjson.com/bins/"
    
    func asURLRequest() throws -> URLRequest {
        let path: String = {
            switch self {
            case .scores:
                return "zvr7l"
            case .audienceValues:
                return "19iz7l"
            case .audienceGrowth:
                return "suu9t"
            case .demographicsAge:
                return "6vy1t"
            case .demographicsGender:
                return "c8uht"
            }
        }()
        
        let url = try APIRouter.baseURLString.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(path))
        return try URLEncoding.default.encode(urlRequest, with: nil)
    }
    
    func dataRequest() -> DataRequest? {
        guard let urlRequest = try? asURLRequest() else { return nil }
        return Alamofire.request(urlRequest)
    }
}
