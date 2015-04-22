//
//  AccountViewController.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/8/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    var service:Services = Services.sharedInstance
    var accountNumber:String?
    var account:Account?
    var ACCOUNT_NUMBER:String = "1234567890"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountNameLabel.accessibilityIdentifier = "accountNameLabel"
        accountNumberLabel.accessibilityIdentifier = "accountNumberLabel"
        accountTypeLabel.accessibilityIdentifier = "accountTypeLabel"
        balanceLabel.accessibilityIdentifier = "balanceLabel"
        
        accountNumber = ACCOUNT_NUMBER;
        
        if let acc = accountNumber {
            
            service.getAccountInfo(acc, completion: { (acc, error) -> Void in
                self.account = acc!
                self.accountNumberLabel.text = self.account?.formatMaskNumber()
                self.balanceLabel.text = self.account?.balance
                
            })
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
