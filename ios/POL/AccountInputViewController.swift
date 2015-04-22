//
//  AccountInputViewController.swift
//  POL
//
//  Created by Bon on 4/22/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class AccountInputViewController: UIViewController {

    @IBOutlet weak var accountNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountNumberTextField.accessibilityIdentifier = "accountNumberTextField"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "goToAccountViewController"){
            var accountController = segue.destinationViewController as! AccountViewController
            accountController.accountNumber = accountNumberTextField.text
            
        }
    }

}
