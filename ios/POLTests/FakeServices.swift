//
//  FakeServices.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/10/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class FakeServices: Services {
   
    override class var sharedInstance : Services {
        
        struct Static {
            static let instance : Services = FakeServices()
        }
        return Static.instance
    }
    
    override func getAccountList(completion:([Account]?) -> Void) {
        completion([AccountBuilder().build()!])
    }
    
}
