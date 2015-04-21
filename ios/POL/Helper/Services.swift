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
private let _sharedInstance = Services()

class Services {
    
//    class var sharedInstance : Services {
//        
//        struct Static {
//            static let instance : Services = Services()
//        }
//        return Static.instance
//    }
    
    
    class var sharedInstance: Services {
        return _sharedInstance
    }
    
    func getAccountInfo(accNumber:String, completion:(Account?, NSError?) -> Void)  {
        Alamofire.request(.GET, "\(DEV_ENDPOINT)/users/123/accounts/\(accNumber)", parameters: nil).responseJSON {
            (request, response, data, error) in
            
            if error == nil {
                if let JSON = data as? NSDictionary {
                    
                    if let accNum = JSON["number"] as? String {
                        var money = JSON["balance"] as! Double
                        var account = Account(number: accNum, name: "DUMMY", type: AccountType.Saving , balance: "\(money)")
                        completion(account, nil)
                    }
                    else {
                        completion(nil, NSError(domain: "Invalid JSON data", code: 100 , userInfo: nil))
                    }
                    
                }
            } else {
                completion(nil, error)
            }
        }
        
    }

    
}
