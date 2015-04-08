//
//  EverydayViewController.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 4/1/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

class EverydayViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var balance: UILabel!
    
    
    
    var balValue:String?
    var scroll:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let b = balValue {
            balance.text = b
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollview.contentSize = CGSizeMake(scrollview.frame.size.width, 800)
        scrollview.scrollEnabled = scroll
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
