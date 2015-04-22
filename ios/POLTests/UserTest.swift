//
//  UserTest.swift
//  POL
//
//  Created by Ter on 4/20/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit
import XCTest

class UserTest: XCTestCase {
    
    let userBuilder = UserBuilder()
    let accountBuilder = AccountBuilder()
    
    func test_user_can_instantiate() {
        
        var user:User = userBuilder.build()!
        
        XCTAssertNotNil(user, "user can instantiate")
        XCTAssertTrue(count(user.userId) == 10, "user id should have 10 characters")
 
    }
    
    func test_user_should_have_accounts() {
        var user:User = userBuilder.build()!
        XCTAssertNotNil(user.accounts, "user account should not nil")
    }
    
    func test_user_can_add_and_delete_account() {
        var user:User = userBuilder.build()!
        var account:Account = accountBuilder.build()!
        var account2:Account = accountBuilder.build()!

        var numberOfAccounts = user.accounts.count
        
        user.addAccount(account)
        user.addAccount(account2)
        XCTAssertGreaterThan(user.accounts.count, numberOfAccounts, "user can add account")
        
        numberOfAccounts = user.accounts.count
        
        user.deleteAccount(account)
        XCTAssertLessThan(user.accounts.count, numberOfAccounts, "user can delete account")
    }
    
    func test_user_should_have_default_account() {
        var user:User = userBuilder.build()!
        var account:Account = accountBuilder.build()!

        user.addAccount(account)
        user.setDefaultAccount(account)
        XCTAssertNotNil(user.defaultAccount(), "user should have default account")
    }
}
