//
//  AudienceAlert.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 11.02.2023.
//

import Foundation
import UIKit

class AudienceAlert: UIViewController {
	enum Constants {
		static let backgroundImage: String = "background_image"
	}
	
	private lazy var oneImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.backgroundImage)
		imageView.layer.borderColor = UIColor.whiteTitleColor.cgColor
		imageView.layer.borderWidth = 2
		return imageView
	}()
	private lazy var twoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.backgroundImage)
		imageView.layer.borderColor = UIColor.whiteTitleColor.cgColor
		imageView.layer.borderWidth = 2
		return imageView
	}()
	private lazy var threeImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.backgroundImage)
		imageView.layer.borderColor = UIColor.whiteTitleColor.cgColor
		imageView.layer.borderWidth = 2
		return imageView
	}()
	private lazy var fourImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.backgroundImage)
		imageView.layer.borderColor = UIColor.whiteTitleColor.cgColor
		imageView.layer.borderWidth = 2
		return imageView
	}()
	private lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .white.withAlphaComponent(0.5)
		imageView.layer.borderColor = UIColor.whiteTitleColor.cgColor
		imageView.layer.borderWidth = 3
		imageView.layer.cornerRadius = 10
		return imageView
	}()
	private lazy var gameBrain = GameBrain.shared
	private lazy var currentGraph = 1
	private lazy var oneImageViewHeight = Int.random(in: 20...50)
	private lazy var twoImageViewHeight = Int.random(in: 20...50)
	private lazy var threeImageViewHeight = Int.random(in: 20...50)
	private lazy var fourImageViewHeight = Int.random(in: 20...50)
	private lazy var winImageViewHeight = Int.random(in: 100...150)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addTaps()
		view.backgroundColor = .black.withAlphaComponent(0.3)
		view.addSubview(backgroundImageView)
		backgroundImageView.addSubview(oneImageView)
		backgroundImageView.addSubview(twoImageView)
		backgroundImageView.addSubview(threeImageView)
		backgroundImageView.addSubview(fourImageView)
		
		setConstraints()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		getHelpInfo()
	}
	
	func getHelpInfo() {
		if gameBrain.questionLevel < 11 {
			currentGraph = Int(gameBrain.getEasyAnswer()) ?? 0
		} else {
			currentGraph = Int(gameBrain.getHardAnswer()) ?? 0
		}
		setGraphHeight()
	}
	
	func setGraphHeight () {
		switch currentGraph {
		case 0:
			oneImageView.heightAnchor.constraint(equalToConstant: CGFloat(winImageViewHeight)).isActive = true
			twoImageView.heightAnchor.constraint(equalToConstant: CGFloat(twoImageViewHeight)).isActive = true
			threeImageView.heightAnchor.constraint(equalToConstant: CGFloat(threeImageViewHeight)).isActive = true
			fourImageView.heightAnchor.constraint(equalToConstant: CGFloat(fourImageViewHeight)).isActive = true
		case 1:
			oneImageView.heightAnchor.constraint(equalToConstant: CGFloat(oneImageViewHeight)).isActive = true
			twoImageView.heightAnchor.constraint(equalToConstant: CGFloat(winImageViewHeight)).isActive = true
			threeImageView.heightAnchor.constraint(equalToConstant: CGFloat(threeImageViewHeight)).isActive = true
			fourImageView.heightAnchor.constraint(equalToConstant: CGFloat(fourImageViewHeight)).isActive = true
		case 2:
			oneImageView.heightAnchor.constraint(equalToConstant: CGFloat(oneImageViewHeight)).isActive = true
			twoImageView.heightAnchor.constraint(equalToConstant: CGFloat(twoImageViewHeight)).isActive = true
			threeImageView.heightAnchor.constraint(equalToConstant: CGFloat(winImageViewHeight)).isActive = true
			fourImageView.heightAnchor.constraint(equalToConstant: CGFloat(fourImageViewHeight)).isActive = true
		case 3:
			oneImageView.heightAnchor.constraint(equalToConstant: CGFloat(oneImageViewHeight)).isActive = true
			twoImageView.heightAnchor.constraint(equalToConstant: CGFloat(twoImageViewHeight)).isActive = true
			threeImageView.heightAnchor.constraint(equalToConstant: CGFloat(threeImageViewHeight)).isActive = true
			fourImageView.heightAnchor.constraint(equalToConstant: CGFloat(winImageViewHeight)).isActive = true
		default:
			oneImageView.heightAnchor.constraint(equalToConstant: CGFloat(oneImageViewHeight)).isActive = true
			twoImageView.heightAnchor.constraint(equalToConstant: CGFloat(twoImageViewHeight)).isActive = true
			threeImageView.heightAnchor.constraint(equalToConstant: CGFloat(threeImageViewHeight)).isActive = true
			fourImageView.heightAnchor.constraint(equalToConstant: CGFloat(fourImageViewHeight)).isActive = true
		}
		UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
			self.oneImageView.layoutIfNeeded()
			self.twoImageView.layoutIfNeeded()
			self.threeImageView.layoutIfNeeded()
			self.fourImageView.layoutIfNeeded()
		}
	}
	
	private func addTaps() {
		let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismiss))
		tapScreen.cancelsTouchesInView = false
		view.addGestureRecognizer(tapScreen)
	}

	@objc func dismiss(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	func setConstraints() {
		backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			backgroundImageView.widthAnchor.constraint(equalToConstant: 200),
			backgroundImageView.heightAnchor.constraint(equalToConstant: 200),
			backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		oneImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			oneImageView.widthAnchor.constraint(equalToConstant: 30),
			oneImageView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -15),
			oneImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 16),
		])
		twoImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			twoImageView.widthAnchor.constraint(equalToConstant: 30),
			twoImageView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -15),
			twoImageView.leadingAnchor.constraint(equalTo: oneImageView.trailingAnchor, constant: 16),
		])
		threeImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			threeImageView.widthAnchor.constraint(equalToConstant: 30),
			threeImageView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -15),
			threeImageView.leadingAnchor.constraint(equalTo: twoImageView.trailingAnchor, constant: 16),
		])
		fourImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			fourImageView.widthAnchor.constraint(equalToConstant: 30),
			fourImageView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -15),
			fourImageView.leadingAnchor.constraint(equalTo: threeImageView.trailingAnchor, constant: 16),
		])
	}
}
