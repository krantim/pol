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

    func testServicesInstance() {
        XCTAssertNotNil(Services.sharedInstance, "Services can instantiate")
    }

}
