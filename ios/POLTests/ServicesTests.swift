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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

    
    func testServicesInstance() {
        // This is an example of a functional test case.
        XCTAssertNotNil(Services.sharedInstance, "Services can instantiate")
    }
    
//    func testServiceGetDetail() {
//        let expectation = expectationWithDescription("GET Services detail")
//        
//        Services.sharedInstance.getDetail { (response) -> Void in
//            XCTAssertNotNil(response, "Services is response")
//            expectation.fulfill()
//        }
//        
//        waitForExpectationsWithTimeout(5) { (error) -> Void in
//            if error != nil {
//                XCTFail("Services timeout")
//            }
//        }
//    }
//    
//    func testGetAccountListFromServices() {
//        Services.sharedInstance.getAccountList { (response) -> Void in
//            XCTAssertNotNil(response, "Services is response")
//        }
//    }


}
