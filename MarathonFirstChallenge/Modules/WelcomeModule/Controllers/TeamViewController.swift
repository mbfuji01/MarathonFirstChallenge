//
//  TeamViewController.swift
//  MarathonFirstChallenge
//
//  Created by Alina Artamonova on 09.02.2023.
//

import UIKit

class TeamViewController: UIViewController {
    enum Constants {
        static let closeButtonName: String = "Close"
        static let teamLabelName: String = "Team"
        static let teamMemberOneText: String = "WelcomeModule: Alina Artamonova"
        static let teamMemberTwoText: String = "AnswerModule: Anastasia Smolya"
        static let teamMemberThreeText: String = "MainGameModule: Alexandra Osichka"
        static let teamMemberFourText: String = "SplashModule: Symbat Maidanova"
        static let teamMemberFiveText: String = "ResultModule: Vladimir Smolyar"
        static let teamMemberSixText: String = "Team Leader: Dmitry Chulyukov"
    }
    
    private lazy var teamMemberOneLabel = UILabel.teamMemberLabel
    private lazy var teamMemberTwoLabel = UILabel.teamMemberLabel
    private lazy var teamMemberThreeLabel = UILabel.teamMemberLabel
    private lazy var teamMemberFourLabel = UILabel.teamMemberLabel
    private lazy var teamMemberFiveLabel = UILabel.teamMemberLabel
    private lazy var teamMemberSixLabel = UILabel.teamMemberLabel
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.closeButtonName, for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var teamLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.teamLabelName
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .whiteTitleColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var memberStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .welcomeBackgroundColor
        view.addSubview(closeButton)
        view.addSubview(teamLabel)
        teamMemberOneLabel.text = Constants.teamMemberOneText
        teamMemberTwoLabel.text = Constants.teamMemberTwoText
        teamMemberThreeLabel.text = Constants.teamMemberThreeText
        teamMemberFourLabel.text = Constants.teamMemberFourText
        teamMemberFiveLabel.text = Constants.teamMemberFiveText
        teamMemberSixLabel.text = Constants.teamMemberSixText
        memberStackView = UIStackView(arrangedSubviews: [
            teamMemberOneLabel,
            teamMemberTwoLabel,
            teamMemberThreeLabel,
            teamMemberFourLabel,
            teamMemberFiveLabel,
            teamMemberSixLabel
        ], axis: .vertical, spacing: 15)
        view.addSubview(memberStackView)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        print("closeButtonTapped")
    }
    
    private func setConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 17),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            teamLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        memberStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            memberStackView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 50),
            memberStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])

    }
    
}

    

    
