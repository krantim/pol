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
    
    var service:Services?
    var accountNumber:String?
    var account:Account?
    
    //var user:User?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if let accountNum = account.number {
        
        if let acc = accountNumber {
            
            service?.getAccountInfo(acc, completion: { (acc, error) -> Void in
                self.account = acc!
                self.accountNumberLabel.text = self.account?.formatMaskNumber()
                self.balanceLabel.text = self.account?.balance
                
            })
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAccountData(account:Account) {
//        accountNameLabel.text = account.accountName
//        accountNumberLabel.text = account.accountNumber
//        accountTypeLabel.text = account.getAccountTypeString()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
