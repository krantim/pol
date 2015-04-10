//
//  NotificationViewController.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 4/8/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, BKPasscodeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginDidPressed(sender: AnyObject) {
        let viewController = BKPasscodeViewController()
        viewController.delegate = self
        viewController.passcodeStyle = BKPasscodeInputViewNumericPasscodeStyle
        viewController.type = BKPasscodeViewControllerCheckPasscodeType
        viewController.title = "กรุณาใส่รหัส PIN CODE"
        
        viewController.touchIDManager = BKTouchIDManager(keychainServiceName: "com.scb.balanceprototype")
        viewController.touchIDManager.promptText = "สแกนลายนิ้วมือเพื่อเข้าระบบ"
        viewController.startTouchIDAuthenticationIfPossible()
        
        self.presentViewController(viewController, animated: false, completion: nil)
    }
    
    func passcodeViewController(aViewController: BKPasscodeViewController!, authenticatePasscode aPasscode: String!, resultHandler aResultHandler: ((Bool) -> Void)!) {
        let pin = NSUserDefaults.standardUserDefaults().objectForKey("pin") as String
        if (aPasscode == pin) {
            isLogin = true
            aResultHandler(true)
        } else {
            aResultHandler(false)
        }
    }
    
    func passcodeViewController(aViewController: BKPasscodeViewController!, didFinishWithPasscode aPasscode: String!) {
        aViewController.dismissViewControllerAnimated(false, completion: nil)
        
        performSegueWithIdentifier("goToMain", sender: nil)
        //self.dismissViewControllerAnimated(false, completion: nil)
    }

}
