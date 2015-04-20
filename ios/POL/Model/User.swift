//
//  User.swift
//  POL
//
//  Created by Ter on 4/20/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import Foundation


class User {
    
    var userId:String
    var accounts:NSMutableSet
    private var defaultAcc:Account?
    
    init(id:String) {
        self.userId = id
        self.accounts = NSMutableSet()
    }
    
    func addAccount(account:Account) {
        self.accounts.addObject(account)
    }
    
    func deleteAccount(account:Account) {
        self.accounts.removeObject(account)
    }
    
    func setDefaultAccount(account:Account) {
        if self.accounts.containsObject(account) {
            self.defaultAcc = account
        }
    }
    
    func defaultAccount()-> Account? {
        return defaultAcc
    }
}