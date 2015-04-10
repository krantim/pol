//
//  AccountsPagerViewController.swift
//  POL
//
//  Created by Chanintorn Asavavichairoj on 4/8/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class AccountsPagerViewController: UIViewController, YSLContainerViewControllerDelegate {
    
    var accountData: [Account]?
    var accountControllers = [AccountViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        YSLContainerViewController(controllers: accountControllers, topBarHeight: <#CGFloat#>, parentViewController: <#UIViewController!#>)
        
        var container = YSLContainerViewController(controllers: accountControllers, topBarHeight: 0, parentViewController: self)
        container.delegate = self
        self.view.insertSubview(container.view, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchAccountList(services:Services = Services.sharedInstance) {
        services.getAccountList { [unowned self] (result) -> Void in
            self.accountData = result
            if let data = result {
                for d in data {
                    if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AccountViewController") as? AccountViewController {
                        vc.title = "Account"
                        self.accountControllers.append(vc)
                    }
                }
            }
        }
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
