//
//  RulesViewController.swift
//  MarathonFirstChallenge
//
//  Created by Alina Artamonova on 09.02.2023.
//

import UIKit

class RulesViewController: UIViewController {
    enum Constants {
        static let closeButtonName: String = "Close"
        static let rulesLabelName: String = "Rules"
        static let rulesText: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
    }
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.closeButtonName, for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var rulesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.rulesLabelName
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .whiteTitleColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var rulesTextLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.rulesText
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .whiteTitleColor
        label.textAlignment = .left
        label.numberOfLines = 35
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .welcomeBackgroundColor
        view.addSubview(closeButton)
        view.addSubview(rulesLabel)
        view.addSubview(rulesTextLabel)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 17),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            rulesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        rulesTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 88),
            rulesTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            rulesTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            rulesTextLabel.widthAnchor.constraint(equalToConstant: 736)
        ])
    }
    
}



