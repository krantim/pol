//
//  Account.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/9/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

enum AccountType : Int {
    case Saving
}

class Account: NSObject {
   
    var accountName:String?
    var accountNumber:String?
    var accountType:AccountType?
    
    func getAccountTypeString() -> String? {
        if let type = accountType {
            switch type {
            case .Saving:
                return "Saving Account"
            default:
                return nil
            }
        }
        
        return nil
    }
    
}
