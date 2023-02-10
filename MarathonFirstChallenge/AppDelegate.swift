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
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigation = UINavigationController(rootViewController: SplashViewController())
        navigation.setNavigationBarHidden(true, animated: false)
		window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = navigation

		window?.makeKeyAndVisible()
       
        
		return true
	}
}
