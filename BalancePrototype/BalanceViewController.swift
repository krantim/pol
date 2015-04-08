//
//  BalanceViewController.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 4/1/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController, YSLContainerViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var key = "EverydayVC"
        if !isRegistered {
            key = "EverydayVC2"
        }
        
        var controllers = [AnyObject]()
        
//        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("TotalVC") as? UIViewController {
//            vc.title = "Total"
//            controllers.append(vc)
//        }
        
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier(key) as? EverydayViewController {
            vc.title = "บัญชีออมทรัพย์"
            vc.balValue = "2,435.72 ฿"
            controllers.append(vc)
        }
        
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier(key) as? EverydayViewController {
            vc.title = "บัญชีฝากประจำ"
            vc.balValue = "546,239.14 ฿"
            controllers.append(vc)
        }
        
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier(key) as? EverydayViewController {
            vc.title = "บัตรเครดิต"
            vc.balValue = "9,764.43 ฿"
            controllers.append(vc)
        }
        
        var container = YSLContainerViewController(controllers: controllers, topBarHeight: 25, parentViewController: self)
        container.delegate = self
        self.view.insertSubview(container.view, atIndex: 0)
        
        self.title = "Total"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonDidPressed(sender: AnyObject) {
        if let slider = self.navigationController?.parentViewController as? MainViewController {
            slider.openDrawerWithSide(.Left, animated: true, completion: nil)
        }
    }

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
