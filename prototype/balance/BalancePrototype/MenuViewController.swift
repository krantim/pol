//
//  MenuViewController.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 4/1/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("pin")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let sliding = self.parentViewController as? MainViewController {
            sliding.closeDrawerWithSide(.Left, animated: true, completion: { (result) -> Void in
                isLogin = false
//                if !isRegistered {
//                    isRegistered = false
//                    self.performSegueWithIdentifier("goToLogin", sender: nil)
//                } else {
                    isRegistered = false
                    self.dismissViewControllerAnimated(true, completion: nil)
//                }
            })
        }
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
