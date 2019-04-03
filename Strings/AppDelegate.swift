//
//  AppDelegate.swift
//  Strings
//
//  Created by Dengzunli on 2019/2/26.
//  Copyright © 2019 shandianji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var flag: Int = 5
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        self.requestSomething(callback: {
//            print("callback")
        }) { () -> Bool in
            
            self.flag -= 1
            
            return (self.flag == 0)
            
            
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        
        
    }

    
    
    
    
    func requestSomething(t: Int = 2, callback:@escaping () -> Swift.Void, valiud:@escaping () -> Bool) {
        let queue = DispatchQueue.global()
        queue.async {
            sleep(1)
            //true or false
            if valiud() {
               callback()
            } else {
                queue.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: {
                    self.requestSomething(callback: callback, valiud: valiud)
                })
            }
           
        }
        
    }

    

}

