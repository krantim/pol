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
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("AccountsPagerViewController") as? AccountsPagerViewController
        vc.loadView()
    }

}
