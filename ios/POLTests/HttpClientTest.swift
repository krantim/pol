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

    
    var serverURL = "http://localhost:8081/healthcheck"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


    func test_should_get_request() {
        
        let expectation = expectationWithDescription("GET request")
        
        var httpClient = HttpClient()
        httpClient.get(serverURL, completion: { (jsonData, error) -> Void in
            XCTAssertNil(error, "should not get error from service")
            XCTAssertNotNil(jsonData, "should get JSON data from service")
            expectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            if error != nil {
                XCTFail("Request timed out after 5 seconds")
            }
        }
    }
}
