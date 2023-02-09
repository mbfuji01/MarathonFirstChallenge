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
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = ResultViewController()
		window?.makeKeyAndVisible()
		
		return true
	}
}
