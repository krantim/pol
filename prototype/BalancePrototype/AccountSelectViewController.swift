//
//  AccountSelectViewController.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 4/1/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class AccountSelectViewController: UITableViewController {

    @IBOutlet weak var sw1: UISwitch!
    @IBOutlet weak var sw2: UISwitch!
    @IBOutlet weak var sw3: UISwitch!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        
        btn.enabled = false
        sw1.addTarget(self, action: Selector("valChange:"), forControlEvents: UIControlEvents.ValueChanged)
        sw2.addTarget(self, action: Selector("valChange:"), forControlEvents: UIControlEvents.ValueChanged)
        sw3.addTarget(self, action: Selector("valChange:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func valChange(sender:AnyObject) {
        if sw1.on || sw2.on || sw3.on {
            btn.enabled = true
        } else {
            btn.enabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToMain" {
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }

}
