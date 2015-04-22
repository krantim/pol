//
//  HttpClient.swift
//  POL
//
//  Created by Ter on 4/22/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import Foundation
import Alamofire

class HttpClient {
    
    func get(url:String, completion:(NSDictionary?, NSError?) -> Void  ) {

        Alamofire.request(.GET, url, parameters: nil).responseJSON {
            (request, response, data, error) in
            
            if error == nil {
                if let JSON = data as? NSDictionary {
                    completion(JSON, nil)
                }
                else {
                    completion(nil, NSError(domain: "Invalid JSON data", code: 100 , userInfo: nil))
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
}