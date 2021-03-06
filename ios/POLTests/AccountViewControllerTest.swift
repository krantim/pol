//
//  AccountViewControllerTest.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/9/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit
import XCTest

let ACC_NUM = "1234567890"

class MockService:Services {
    override func getAccountInfo(accNumber: String, completion: (Account?, NSError?) -> Void) {
        var acc = Account(number: accNumber, name: "No name", balance: 1000.0)
        completion(acc,nil)
    }
}

class AccountViewControllerTest: XCTestCase {

    var vc: AccountViewController!
    var user = User(id: "1000")
    
    override func setUp() {
        super.setUp()
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as? AccountViewController
        
        vc.loadView()

        vc.service = MockService(client: HttpClient())
        vc.accountNumber = ACC_NUM
        
        vc.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_view_did_load(){
        XCTAssertNotNil(vc.view, "View did not load")
    }
    
    
    func test_account_number_mask(){
        XCTAssertEqual(vc.accountNumberLabel.text!,  "XXX-XXX789-0", "account number should mask")
    }
    
    func test_view_show_balance() {
        XCTAssertEqual(vc.balanceLabel.text!, "1,000.00", "view should show balance")
    }
    

}
