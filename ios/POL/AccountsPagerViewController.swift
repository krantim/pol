//
//  AccountsPagerViewController.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/8/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class AccountsPagerViewController: UIViewController, YSLContainerViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var controllers = [AnyObject]()
        
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AccountViewController") as? AccountViewController {
            vc.title = "Account"
            controllers.append(vc)
        }
        
        var container = YSLContainerViewController(controllers: controllers, topBarHeight: 0, parentViewController: self)
        container.delegate = self
        self.view.insertSubview(container.view, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - YSLContainerViewControllerDelegate
    
    func containerViewItemIndex(index: Int, currentController controller: UIViewController!) {
        self.title = controller.title
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
