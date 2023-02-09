//
//  TeamViewController.swift
//  MarathonFirstChallenge
//
//  Created by Alina Artamonova on 09.02.2023.
//

import UIKit

class TeamViewController: UIViewController {
    enum Constants {
        static let teamMemberOneLabel: String = "Alina"
        static let teamMemberTwoLabel: String = "Anastasia"
        static let teamMemberThreeLabel: String = "Alexandra"
        static let teamMemberFourLabel: String = "Symbat"
        static let teamMemberFiveLabel: String = "Volodymyr"
        static let teamMemberSixLabel: String = "Dmitry"
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
        teamMemberOneLabel.text = Constants.teamMemberOneLabel
        teamMemberTwoLabel.text = Constants.teamMemberTwoLabel
        teamMemberThreeLabel.text = Constants.teamMemberThreeLabel
        teamMemberFourLabel.text = Constants.teamMemberFourLabel
        teamMemberFiveLabel.text = Constants.teamMemberFiveLabel
        teamMemberSixLabel.text = Constants.teamMemberSixLabel
        memberStackView = UIStackView(arrangedSubviews: [
            teamMemberOneLabel,
            teamMemberTwoLabel,
            teamMemberThreeLabel,
            teamMemberFourLabel,
            teamMemberFiveLabel,
            teamMemberSixLabel
        ], axis: .vertical, spacing: 10)
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
            memberStackView.heightAnchor.constraint(equalToConstant: 150),
            memberStackView.widthAnchor.constraint(equalToConstant: 150)
        ])

    }
    
}

    

    
