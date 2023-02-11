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
	let defaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		
        let navigationController = UINavigationController(rootViewController: SplashViewController())
		window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		if defaults.string(forKey: "bestScore") == nil {
			defaults.set("$0", forKey: "bestScore")
		}
//		defaults.set(nil, forKey: "bestScore")
        
		return true
	}
}
