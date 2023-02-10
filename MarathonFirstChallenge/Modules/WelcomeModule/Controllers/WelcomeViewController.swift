//
//  WelcomeViewController.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 05.02.2023.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    enum Constants {
        static let backgroundImage: String = "background_image"
        static let rulesButtonImage: String = "rules_image"
        static let logoImage: String = "logo_image"
        static let gameNameText: String = "Who Wants \nto be a Millionare"
        static let scoreText: String = "All-time Best Score"
        static let coinImage: String = "coin_image"
        static let selfBestScore: String = "$XXX"
        static let newGameButtonImage: String = "new_game_button"
        static let teamButtonText: String = "© TEAM 10"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.backgroundImage)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: Constants.rulesButtonImage), for: .normal)
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.logoImage)
        return imageView
    }()
    
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.gameNameText
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
        label.textColor = .whiteTitleColor
        label.alpha = 0.5
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
        button.setBackgroundImage(UIImage(named: Constants.newGameButtonImage), for: .normal)
        button.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
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
    
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(rulesButton)
        generalInformationStackView = UIStackView(arrangedSubviews: [
            logoImageView,
            gameNameLabel,
            bestScoreLabel
        ], axis: .vertical, spacing: 16)
        view.addSubview(generalInformationStackView)
        scoreStackView = UIStackView(arrangedSubviews: [
            coinImageView,
            selfBestScoreLabel
        ], axis: .horizontal, spacing: 1)
        view.addSubview(scoreStackView)
        view.addSubview(newGameButton)
        view.addSubview(teamButton)
    }

    @objc private func rulesButtonTapped() {
        let rulesText = RulesViewController()
        self.present(rulesText, animated: true, completion: nil)
    }
    
    @objc private func newGameButtonTapped() {
    }
    
    @objc private func teamButtonTapped() {
        let teamText = TeamViewController()
        self.present(teamText, animated: true, completion: nil)
    }
    
    private func setConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14.67),
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 323),
            rulesButton.widthAnchor.constraint(equalToConstant: 32),
            rulesButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        generalInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            generalInformationStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 168),
            generalInformationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        scoreStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreStackView.topAnchor.constraint(equalTo: bestScoreLabel.bottomAnchor, constant: 8),
            scoreStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 597),
            newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        teamButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 691),
            teamButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
}



