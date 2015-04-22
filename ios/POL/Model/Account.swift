//
//  Account.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/9/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

func == (lhs: Account, rhs: Account) -> Bool {
    if lhs.name == rhs.name &&
        lhs.number == rhs.number &&
        lhs.type == rhs.type {
            return true
    }
    return false
}


class Account {
   
    var name:String
    var number:String
    var type:String
    var balance:Double
    
    init(number:String, name:String, balance:Double) {
        self.name = name
        self.number = number
        self.type = "Savings"
        self.balance = balance
    }
    
    func maskNumber() -> String? {
        if count(number) == 10 {
            var maskNumber = "XXXXXX\((number as NSString).substringFromIndex(5))"
            return maskNumber
        }
        return nil
    }
    
    func formatNumber() -> String? {
        if count(number) == 10 {
            return "\(number[0...2])-\(number[3...8])-\(number[9])"
        }
        return nil
    }
    
    func formatMaskNumber() -> String? {
        var s = Array(number)
        if count(s) == 10 {
            return "XXX-XXX\(number[6...8])-\(number[9])"
        }
        return nil
    }
    
    
}
