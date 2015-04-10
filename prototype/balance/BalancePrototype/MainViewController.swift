//
//  MainViewController.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 4/1/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class MainViewController: JVFloatingDrawerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let menuController = self.storyboard?.instantiateViewControllerWithIdentifier("MenuViewController") as? UIViewController {
            self.leftViewController = menuController
        }
        
        if let mainController = self.storyboard?.instantiateViewControllerWithIdentifier("MainViewController") as? UIViewController {
            self.centerViewController = mainController
        }
        
        //self.backgroundImage = UIImage(named: "")
        self.animator = JVFloatingDrawerSpringAnimator()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
