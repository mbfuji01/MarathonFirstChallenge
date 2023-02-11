//
//  ResultViewController.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 05.02.2023.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
	enum Constants {
		static let backgroundImage: String = "background_image"
		static let logoImage: String = "logo_image"
		static let gameOverText: String = "Game Over"
		static let scoreText: String = "Level 1"
		static let coinImage: String = "coin_image"
		static let selfBestScore: String = "$0"
		static let newGameButtonImage: String = "title_yellow_button"
		static let mainScreenButtonImage: String = "title_dark_blue_button"
		static let teamButtonText: String = "© TEAM 10"
		static let newGameButtonText: String = "New game"
		static let mainScreenButtonText: String = "Main screen"
		static let logoImageViewSize: CGFloat = 195.0
		static let logoImageTopSpacing: CGFloat = 150.0
		static let generalInfoTopSpacing: CGFloat = 16.0
		static let generalInfoSideSpacing: CGFloat = 32
		static let scoreTopSpacing: CGFloat = 8
		static let teamButtonBottomSpacing: CGFloat = 30
		static let newGameButtonSideSpacing: CGFloat = 32
		static let buttonBottomSpacing: CGFloat = 20
	}
	
	//MARK: - Create UI
	
	private lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.backgroundImage)
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()
	
	private lazy var logoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.logoImage)
		return imageView
	}()
	
	private lazy var gameOverLabel: UILabel = {
		let label = UILabel()
		label.text = Constants.gameOverText
		label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
		label.textColor = .whiteTitleColor
		label.numberOfLines = 2
		label.textAlignment = .center
		return label
	}()
	
	private lazy var bestScoreLabel: UILabel = {
		let label = UILabel()
		label.text = Constants.scoreText
		label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		label.textColor = .descriptionTitleColor
		label.textAlignment = .center
		return label
	}()
	
	private lazy var coinImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.coinImage)
		return imageView
	}()
	
	private lazy var selfBestScoreLabel: UILabel = {
		let label = UILabel()
		label.text = Constants.selfBestScore
		label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
		label.textColor = .whiteTitleColor
		label.textAlignment = .center
		return label
	}()
	
	private lazy var newGameButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle(Constants.newGameButtonText, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
		button.tintColor = .whiteTitleColor
		button.setBackgroundImage(UIImage(named: Constants.newGameButtonImage), for: .normal)
		button.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
		return button
	}()
	
	private lazy var mainScreenButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle(Constants.mainScreenButtonText, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
		button.tintColor = .whiteTitleColor
		button.setBackgroundImage(UIImage(named: Constants.mainScreenButtonImage), for: .normal)
		button.addTarget(self, action: #selector(mainScreenButtonTapped), for: .touchUpInside)
		return button
	}()
	
	private lazy var teamButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle(Constants.teamButtonText, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		button.tintColor = .whiteTitleColor
		button.addTarget(self, action: #selector(teamButtonTapped), for: .touchUpInside)
		return button
	}()
	 
	private lazy var scoreStackView = UIStackView()
	private lazy var generalInformationStackView = UIStackView()
	private lazy var gameBrain = GameBrain.shared
	let defaults = UserDefaults.standard
    
	//MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
	}
	
	private func setupViews() {
		generalInformationStackView = UIStackView(arrangedSubviews: [
			gameOverLabel,
			bestScoreLabel
		], axis: .vertical, spacing: 16)
		
		scoreStackView = UIStackView(arrangedSubviews: [
			coinImageView,
			selfBestScoreLabel
		], axis: .horizontal, spacing: 1)
		
		view.addSubview(backgroundImageView)
		view.addSubview(logoImageView)
		view.addSubview(generalInformationStackView)
		view.addSubview(scoreStackView)
		view.addSubview(newGameButton)
		view.addSubview(mainScreenButton)
		view.addSubview(teamButton)

		navigationController?.isNavigationBarHidden = true
		bestScoreLabel.text = "Level \(gameBrain.questionLevel)"
		let bestScore = defaults.string(forKey: "bestScore")
		switch gameBrain.questionLevel {
		case 4...8:
			selfBestScoreLabel.text = "$5,000"
		case 9...13:
			selfBestScoreLabel.text = "$25,000"
		case 14:
			selfBestScoreLabel.text = "$1,000,000"
		default:
			selfBestScoreLabel.text = "$0"
		}
		if bestScore?.count ?? 0 < selfBestScoreLabel.text?.count ?? 0 {
			defaults.set(selfBestScoreLabel.text, forKey: "bestScore")
		}
	}
	
	//MARK: - Button function
    
	@objc private func newGameButtonTapped() {
		gameBrain.resetGame()
		let mainGameVC = MainGameViewController()
		self.navigationController?.pushViewController(mainGameVC, animated: true)
	}
	
	@objc private func mainScreenButtonTapped() {
		gameBrain.resetGame()
		let welcomeVC = WelcomeViewController()
		self.navigationController?.pushViewController(welcomeVC, animated: true)
	}
	
	@objc private func teamButtonTapped() {
		let teamVC = TeamViewController()
		self.present(teamVC, animated: true, completion: nil)
	}
	
	//MARK: - setConstraints
	
	private func setConstraints() {
		backgroundImageView.frame = view.frame
		logoImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.logoImageTopSpacing),
			logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			logoImageView.widthAnchor.constraint(equalToConstant: Constants.logoImageViewSize),
			logoImageView.heightAnchor.constraint(equalToConstant: Constants.logoImageViewSize),
		])
		generalInformationStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			generalInformationStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Constants.generalInfoTopSpacing),
			generalInformationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.generalInfoSideSpacing),
			generalInformationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.generalInfoSideSpacing),
			generalInformationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		scoreStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			scoreStackView.topAnchor.constraint(equalTo: bestScoreLabel.bottomAnchor, constant: Constants.scoreTopSpacing),
			scoreStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		newGameButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			newGameButton.bottomAnchor.constraint(equalTo: mainScreenButton.topAnchor, constant: -Constants.buttonBottomSpacing),
			newGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.newGameButtonSideSpacing),
			newGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.newGameButtonSideSpacing),
			newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])
		mainScreenButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			mainScreenButton.bottomAnchor.constraint(equalTo: teamButton.topAnchor, constant: -Constants.buttonBottomSpacing),
			mainScreenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.newGameButtonSideSpacing),
			mainScreenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.newGameButtonSideSpacing),
			mainScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])
		teamButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			teamButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.teamButtonBottomSpacing),
			teamButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])
	}
}
