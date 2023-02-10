//
//  AppDelegate.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 05.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
        
        let navigationController = UINavigationController(rootViewController: SplashViewController())
        
		window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
        
		return true
	}
}
