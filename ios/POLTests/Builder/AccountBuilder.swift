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
        account = Account()
        account?.accountName = randomStringWithLength(20)
        account?.accountNumber = "1234-5678-9000"
        account?.accountType = .Saving
    }
    
    func withAccountName(accountName: String) -> AccountBuilder {
        account?.accountName = accountName
        return self
    }
    
    func withAccountNumber(accountNumber: String) -> AccountBuilder {
        account?.accountNumber = accountNumber
        return self
    }
    
    func withAccountType(accountType: AccountType) -> AccountBuilder {
        account?.accountType = accountType
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
