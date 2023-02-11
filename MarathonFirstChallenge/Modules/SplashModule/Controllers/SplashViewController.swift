//
//  SplashViewController.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 06.02.2023.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
	enum Constants {
		static let backgroundImage: String = "background_image"
		static let logoImage: String = "logo_image"
		static let logoImageViewSize: CGFloat = 267.0
	}
	
	//MARK: - Create UI
	
	private lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.backgroundImage)
		return imageView
	}()
	
	private lazy var logoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.logoImage)
		return imageView
	}()
	
	//MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
		setTimer()
        navigationController?.isNavigationBarHidden = true
	}
    
	private func setupViews() {
		view.addSubview(backgroundImageView)
		view.addSubview(logoImageView)
	}
	
	private func setTimer() {
		Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
			let controller = WelcomeViewController()
			self.navigationController?.pushViewController(controller, animated: true)
		}
	}
	
	private func setConstraints() {
		logoImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			logoImageView.heightAnchor.constraint(equalToConstant: Constants.logoImageViewSize),
			logoImageView.widthAnchor.constraint(equalToConstant: Constants.logoImageViewSize),
			logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
	}
}
