//
//  AppDelegate.swift
//  BalancePrototype
//
//  Created by Chanintorn Asavavichairoj on 3/31/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        GAI.sharedInstance().trackUncaughtExceptions = true
        GAI.sharedInstance().dispatchInterval = 20
        GAI.sharedInstance().logger.logLevel = GAILogLevel.Verbose
        GAI.sharedInstance().trackerWithTrackingId("UA-61473818-1")
        
        Mixpanel.sharedInstanceWithToken("9503b8ed2d58d2fea8821bda2adef7cf")
        
        let userNotificationTypes = (.Alert |
            .Badge |
            .Sound) as UIUserNotificationType
        
        if objc_getClass("UIUserNotificationSettings") != nil {
            let settings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil) as UIUserNotificationSettings
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        } else {
            application.registerForRemoteNotificationTypes(.Badge | .Alert | .Sound)
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        notification("โอนเงินเข้า บัญชีนายไทย พาณิชย์ (x-123456) +10,000 บาท เมื่อ วันที่ 22 ก.ย. 2558 12:45 น.", time: 5.0)
        //notification("คุณมียอดชำระค่าไฟจำนวน 2,024.21 บาท", time: 12.0)
        //notification("เงินในบัญชีไม่พอชำระค่าไฟ 2024.21 บาท", time: 14.0)
    }
    
    func notification(message:String, time:Double) {
        var notification = UILocalNotification()
        notification.fireDate = NSDate().dateByAddingTimeInterval(time)
        notification.alertBody = message
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }


}

