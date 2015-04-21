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
        var acc = Account(number: accNumber, name: "No name", type: .Saving, balance: "100")
        completion(acc,nil)
    }
}

class AccountViewControllerTest: XCTestCase {

    var vc: AccountViewController!
    var user = User(id: "1000")
    
    //var service = MockService()
    

    var account = Account(number: ACC_NUM, name: "Test", type: AccountType.Saving, balance: "100")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as? AccountViewController
        
        vc.loadView()

        vc.service = MockService()
        vc.accountNumber = ACC_NUM
        
        vc.viewDidLoad()
        
        //print(vc.accountNumberLabel.text)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_view_did_load(){
        XCTAssertNotNil(vc.view, "View did not load")
    }
    
    func test_service_available(){
        
        vc.service?.getAccountInfo(ACC_NUM, completion: { (account, error) -> Void in
            XCTAssertNotNil(account, "service should return account")
        })
        
    }
    
    func test_account_number_mask(){
        XCTAssertEqual(vc.accountNumberLabel.text!,  "XXX-XXX789-0", "account number should mask")
    }
    
    func test_view_show_balance() {
        
        XCTAssertEqual(vc.balanceLabel.text!, "100", "view should show balance")
    }

    //func test_display_account_detail_from_model ()
    
    func testDisplayAccountDetailFromModel() {
        var account = AccountBuilder().build()
        vc.setupAccountData(account!)
        
//        XCTAssertEqual(vc.accountNameLabel!.text!, account!.accountName!, "account name is equal")
//        XCTAssertEqual(vc.accountNumberLabel!.text!, account!.accountNumber!, "account number is equal")
//        XCTAssertEqual(vc.accountTypeLabel!.text!, account!.getAccountTypeString()!, "account type is equal")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
