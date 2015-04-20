//
//  Services.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/8/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit
import Alamofire

let DEV_ENDPOINT = "http://localhost:8080"

class Services: NSObject {
    
    class var sharedInstance : Services {
        
        struct Static {
            static let instance : Services = Services()
        }
        return Static.instance
    }
    
    func getDetail(completion:(AnyObject?) -> Void) {
        Alamofire.request(.GET, "\(DEV_ENDPOINT)/get", parameters: ["foo": "bar"])
            .response { (request, response, data, error) in
                println(request)
                println(response)
                println(error)
                
                completion(response)
        }
    }
    
    func getAccountList(completion:([Account]?) -> Void) {
        
    }
    
}
