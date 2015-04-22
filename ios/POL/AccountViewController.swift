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
                    self.balanceLabel.text = self.formatBalance(self.account!.balance)
                } else {
                    self.accountNumberLabel.text = "Invalid account number"
                }
            })
            
        }

    }
    
    
    func formatBalance(amount: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.currencySymbol = ""
        return formatter.stringFromNumber(amount)!
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
