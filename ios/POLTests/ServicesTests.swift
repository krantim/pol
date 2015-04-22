//
//  ServicesTests.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/10/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit
import XCTest

class ServicesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldCreateAccountFromServiceResponse() {
        var httpClient = MockHttpClient()
        var service = Services(client: httpClient)
        
        service.getAccountInfo("account number",completion: { (account , error  ) -> Void in
            XCTAssertNotNil(account, "service can return account information")
            XCTAssertEqual(account!.balance, 1000.0 , "balance should match balance from service")
            XCTAssertEqual(account!.number, httpClient.accountNumber, "account number should match account number from service")
        })
    }

}

class MockHttpClient:HttpClient {
    let accountNumber:String = "1234567890"
    
    override func get(url: String, completion: (NSDictionary?, NSError?) -> Void) {
        var accountData = ["number":self.accountNumber, "balance":1000.00 ]
        completion(accountData, nil)
    }
    
}

