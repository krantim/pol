//
//  ViewController.swift
//  WaterAnimation
//
//  Created by Chanintorn Asavavichairoj on 4/4/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var canvas: UIView!
    var waterView: WaterView!
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var frame = CGRectMake(0, 0, 300, 300)
        waterView = WaterView(frame: frame)
        canvas.addSubview(waterView)
        canvas.layer.masksToBounds = true
        
        motionManager = CMMotionManager()
        motionManager.deviceMotionUpdateInterval = 0.01
        
        var motionQueue = NSOperationQueue()
        motionManager.startDeviceMotionUpdatesUsingReferenceFrame(CMAttitudeReferenceFrameXTrueNorthZVertical, toQueue: motionQueue) { (motion, error) -> Void in
            var x = motion.gravity.x
            var y = motion.gravity.y
            var z = motion.gravity.z
            
            var angle = CGFloat(atan2(y, x) + M_PI_2)
            if z > -0.99 {
                self.waterView.layer.transform = CATransform3DRotate(CATransform3DIdentity, -angle, 0, 0, 1)
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

