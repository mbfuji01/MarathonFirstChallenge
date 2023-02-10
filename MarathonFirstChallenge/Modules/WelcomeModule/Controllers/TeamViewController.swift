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
        static let teamMemberTwoText: String = "AnswerModule: Anastasiya Smoliak"
        static let teamMemberThreeText: String = "MainGameModule: Alexandra Osichka"
        static let teamMemberFourText: String = "SplashModule: Symbat Maidanova"
        static let teamMemberFiveText: String = "ResultModule: Vladimir Smolyar"
        static let teamMemberSixText: String = "Team Leader: Dmitry Chulyukov"
		static let closeButtonTopSpacing: CGFloat = 16.0
		static let closeButtonLeadingSpacing: CGFloat = 16.0
		static let teamLabelTopSpacing: CGFloat = 16.0
		static let memberStackViewTopSpacing: CGFloat = 50.0
		static let memberStackViewSideSpacing: CGFloat = 32.0
    }
	
	//MARK: - Create UI
    
    private lazy var teamMemberOneLabel = UILabel.teamMemberLabel
    private lazy var teamMemberTwoLabel = UILabel.teamMemberLabel
    private lazy var teamMemberThreeLabel = UILabel.teamMemberLabel
    private lazy var teamMemberFourLabel = UILabel.teamMemberLabel
    private lazy var teamMemberFiveLabel = UILabel.teamMemberLabel
    private lazy var teamMemberSixLabel = UILabel.teamMemberLabel
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.closeButtonName, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
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
	
	//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        self.navigationController?.isNavigationBarHidden =  true
    }
    
    private func setupViews() {
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
		
		teamMemberOneLabel.text = Constants.teamMemberOneText
		teamMemberTwoLabel.text = Constants.teamMemberTwoText
		teamMemberThreeLabel.text = Constants.teamMemberThreeText
		teamMemberFourLabel.text = Constants.teamMemberFourText
		teamMemberFiveLabel.text = Constants.teamMemberFiveText
		teamMemberSixLabel.text = Constants.teamMemberSixText
    }
	
	//MARK: - Button function
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        print("closeButtonTapped")
    }
	
	//MARK: - setConstraints
    
    private func setConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.closeButtonTopSpacing),
			closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.closeButtonLeadingSpacing)
        ])
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			teamLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.teamLabelTopSpacing),
            teamLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        memberStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			memberStackView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: Constants.memberStackViewTopSpacing),
			memberStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.memberStackViewSideSpacing),
			memberStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.memberStackViewSideSpacing)
        ])
    }
}

    

    
