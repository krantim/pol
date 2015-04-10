//
//  OTPViewController.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 3/31/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class OTPViewController: GAITrackedViewController, BKPasscodeViewControllerDelegate {
    
    @IBOutlet weak var otp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Enter OTP"
        otp.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.screenName = "Hey OTP Screen"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func passedOTP(sender: AnyObject) {
        let viewController = BKPasscodeViewController()
        viewController.delegate = self
        viewController.passcodeStyle = BKPasscodeInputViewNumericPasscodeStyle
        viewController.type = BKPasscodeViewControllerNewPasscodeType
        viewController.navigationItem.hidesBackButton = true
        viewController.title = "ตั้งรหัสเพื่อใช้ครั้งต่อไป"
        
        viewController.touchIDManager = BKTouchIDManager(keychainServiceName: "com.scb.balanceprototype")
        viewController.touchIDManager.promptText = "สแกนลายน้ิวมือเพื่อใช้ครั้งต่อไป"
        
        self.navigationController?.pushViewController(viewController, animated: true)
        //presentViewController(viewController, animated: true, completion: nil)
        
        var event = GAIDictionaryBuilder.createEventWithCategory("Register", action: "Confirm OTP", label: "OTP", value: NSNumber(int: 0)).build()
        GAI.sharedInstance().defaultTracker.send(event as [NSObject:AnyObject])
        
        var mixpanel = Mixpanel.sharedInstance()
        mixpanel.track("Confirm OTP", properties: ["Key": "Value"])
    }

    func passcodeViewController(aViewController: BKPasscodeViewController!, didFinishWithPasscode aPasscode: String!) {
        NSUserDefaults.standardUserDefaults().setObject(aPasscode, forKey: "pin")
        NSUserDefaults.standardUserDefaults().synchronize()
        //aViewController.dismissViewControllerAnimated(false, completion: nil)
        self.navigationController?.popToViewController(self, animated: false)
        
        isLogin = true
        isRegistered = true
        self.performSegueWithIdentifier("goToMainSetting", sender: nil)
        //self.dismissViewControllerAnimated(false, completion:nil)
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
