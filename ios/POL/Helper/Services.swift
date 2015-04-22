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

class Services {
    
    var httpClient:HttpClient
    
    init(client:HttpClient) {
        
        self.httpClient = client
    }
    
    
    func getAccountInfo(accNumber:String, completion:(Account?, NSError?) -> Void)  {
        
        var JSON = httpClient.get(DEV_ENDPOINT)
        
        if let accNum = JSON["number"] as? String {
            var money = JSON["balance"] as! Double
            var account = Account(number: accNum, name: "DUMMY", balance: money)
            completion(account, nil)
        }
        else {
            completion(nil, NSError(domain: "Invalid JSON data", code: 100 , userInfo: nil))
        }
        
    }

    
}
