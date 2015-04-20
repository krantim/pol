//
//  AccountTest.swift
//  POL
//
//  Created by Ter on 4/20/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit
import XCTest

class AccountTest: XCTestCase {

    let accountBuilder = AccountBuilder()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_account_can_instantiate() {
        
        var account:Account = accountBuilder.build()!
        XCTAssertNotNil(account, "account can instantiate")
        
    }

    func test_account_should_have_account_number() {
        
        var account:Account = accountBuilder.build()!
        XCTAssertNotNil(account.number, "account should have a acc.number")
        XCTAssertEqual( count( account.number) , 10, "account number should not over 10 digits")
        
    }
    
    func test_account_can_mask_account_number(){
        
        var account:Account = accountBuilder.build()!
        var accountNumber = account.number as NSString
        XCTAssertTrue(account.maskNumber()! == "XXXXXX\(accountNumber.substringFromIndex(5))", "account number can mask number")
        
    }
    
    func test_account_can_format_account_number() {
        
        var account:Account = accountBuilder.build()!
        var accountNumber = account.number as NSString
        
        var regexNumber = NSPredicate(format:  "SELF MATCHES %@", "[0-9]{3}-[0-9]{6}-[0-9]{1}")
        var regexMask = NSPredicate(format:  "SELF MATCHES %@", "XXX-XXX[0-9]{3}-[0-9]{1}")
        
        XCTAssertTrue(regexNumber.evaluateWithObject( account.formatNumber()!), "account can display format number")
        XCTAssertTrue(regexMask.evaluateWithObject( account.formatMaskNumber()!), "account can display format mask number")
        
    }

}
