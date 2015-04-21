//
//  AccountsPagerViewControllerTests.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/10/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit
import XCTest

class AccountsPagerViewControllerTests: XCTestCase {
    
    var vc: AccountsPagerViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("AccountsPagerViewController") as? AccountsPagerViewController
        vc.loadView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

//    func testCreateControllerFromModel() {
//        // This is an example of a functional test case.
//        vc.fetchAccountList(services: FakeServices.sharedInstance)
//        XCTAssertGreaterThanOrEqual(vc.accountControllers.count, vc.accountData!.count, "account controller is equal with model")
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
