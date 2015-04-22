//
//  HttpClient.swift
//  POL
//
//  Created by Ter on 4/22/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import Foundation

class HttpClient {
    
    func get(url:String) -> NSDictionary {
        return [:]
        
        
        //        Alamofire.request(.GET, "\(DEV_ENDPOINT)/users/123/accounts/\(accNumber)", parameters: nil).responseJSON {
        //            (request, response, data, error) in
        //
        //            if error == nil {
        //                if let JSON = data as? NSDictionary {
        //
        //                    if let accNum = JSON["number"] as? String {
        //                        var money = JSON["balance"] as! Double
        //                        var account = Account(number: accNum, name: "DUMMY", type: AccountType.Saving , balance: "\(money)")
        //                        completion(account, nil)
        //                    }
        //                    else {
        //                        completion(nil, NSError(domain: "Invalid JSON data", code: 100 , userInfo: nil))
        //                    }
        //
        //                }
        //            } else {
        //                completion(nil, error)
        //            }
        //        }
    }
    
}