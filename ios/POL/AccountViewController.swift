//
//  AccountViewController.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/8/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    var service:Services = Services(client: HttpClient())
    var accountNumber:String?
    var account:Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountNumberLabel.accessibilityIdentifier = "accountNumberLabel"
        accountTypeLabel.accessibilityIdentifier = "accountTypeLabel"
        balanceLabel.accessibilityIdentifier = "balanceLabel"
        
        if let acc = accountNumber {
            service.getAccountInfo(acc, completion: { (account, error) -> Void in
                if let a = account {
                    self.account = a
                    self.accountNumberLabel.text = a.formatMaskNumber()
                    self.balanceLabel.text = a.balance
                } else {
                    self.accountNumberLabel.text = "Invalid account number"
                }
            })
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
