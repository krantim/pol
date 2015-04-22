//
//  HttpClientTest.swift
//  POL
//
//  Created by Ter on 4/22/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit
import XCTest

class HttpClientTest: XCTestCase {

    
    var serverURL = "http://localhost"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


    func test_should_get_request() {
        
        var httpClient = HttpClient()
        XCTAssertNotNil(httpClient.get(serverURL),"http client should get response from server" )
        
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

}
