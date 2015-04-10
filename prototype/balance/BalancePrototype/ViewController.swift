//
//  ViewController.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 3/31/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

var isLogin:Bool = false
var isRegistered:Bool = false

class ViewController: GAITrackedViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var fiveStarsShape = DPMeterView()
//        fiveStarsShape.frame = CGRectMake(0, self.view.center.y, self.view.frame.size.width, self.view.frame.size.height/2)
//        fiveStarsShape.setShape(UIBezierPath.stars(1, shapeInFrame: fiveStarsShape.bounds).CGPath)
//        fiveStarsShape.setProgress(0.6, animated: true)
//        fiveStarsShape.startGravity()
//        self.view.addSubview(fiveStarsShape)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.screenName = "Hello First Screen"
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let pin = NSUserDefaults.standardUserDefaults().objectForKey("pin") as? String {
            
            if !isLogin {
                performSegueWithIdentifier("goToNoti", sender: nil)
            }
            
            if isRegistered {
                performSegueWithIdentifier("goToMain", sender: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToMain" {
            
        }
    }
    
}

