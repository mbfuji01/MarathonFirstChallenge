//
//  TeamViewController.swift
//  MarathonFirstChallenge
//
//  Created by Alina Artamonova on 09.02.2023.
//

import UIKit

class TeamViewController: UIViewController {
    enum Constants {
        static let teamMemberOneText: String = "WelcomeModule: Alina"
        static let teamMemberTwoText: String = "AnswerModule: Anastasia"
        static let teamMemberThreeText: String = "MainGameModule: Alexandra"
        static let teamMemberFourText: String = "SplashModule: Symbat"
        static let teamMemberFiveText: String = "ResultModule: Volodymyr"
        static let teamMemberSixText: String = "Team Leader: Dmitry"
        static let closeButtonName: String = "Close"
        static let teamLabelName: String = "Team"
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
        view.backgroundColor = .welcomeBackgroundColor
        view.addSubview(closeButton)
        view.addSubview(teamLabel)
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
            memberStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memberStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

    }
    
}

    

    
