//
//  APIManager.swift
//  WireStorm
//
//  Created by Zhang Yi on 21/1/2016.
//
//

import Foundation
import Alamofire
import SwiftyJSON

// Simple wrapper for fetching assets
class APIManager {
    class func getAssets(completion:([AssetType]?, ErrorType?) -> ()){
        Alamofire.request(.GET, kURLJson)
            .responseData { response  in
                // When error occured
                guard let data = response.result.value where response.result.error == nil else {
                    completion(nil, response.result.error)
                    return
                }
                
                // As much simple it can be.
                completion (JSON(data: data).arrayValue.map{Asset(json: $0)}, nil)
        }
    }
}