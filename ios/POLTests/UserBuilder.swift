//
//  UserBuilder.swift
//  POL
//
//  Created by Ter on 4/20/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import Foundation

class UserBuilder {
    private var user: User?
    
    init() {
        user = User(id: randomStringWithLength(10))
    }
    
    func withUserId(userId: String) -> UserBuilder {
        user?.userId = userId
        return self
    }
    
    func build() -> User? {
        return user
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