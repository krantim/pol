//
//  AccountBuilder.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/9/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class AccountBuilder {
   
    private var account: Account?
    
    init() {
        account = Account(number: "0123456789", name: randomStringWithLength(20), balance: 100.0)
    }
    
    func withAccountName(accountName: String) -> AccountBuilder {
        account?.name = accountName
        return self
    }
    
    func withAccountNumber(accountNumber: String) -> AccountBuilder {
        account?.number = accountNumber
        return self
    }
    
    func build() -> Account? {
        return account
    }
    
    func randomStringWithLength(len: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return "\(randomString)"
    }
    
}
