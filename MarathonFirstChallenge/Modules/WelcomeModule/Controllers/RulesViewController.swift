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
		static let closeButtonTopSpacing: CGFloat = 16.0
		static let closeButtonLeadingSpacing: CGFloat = 16.0
		static let rulesLabelTopSpacing: CGFloat = 16.0
		static let rulesTextLabelTopSpacing: CGFloat = 48.0
		static let rulesTextLabelSideSpacing: CGFloat = 32.0
		static let rulesText: String =
		"    Игра “Кто хочет стать миллионером?” - это конкурс викторина, в котором участники должны правильно ответить на ряд вопросов с несколькими вариантами ответов, чтобы перейти на следующий уровень.\n \n    Всего 15 вопросов, каждый вопрос стоит определенной суммы денег, участники не имеют никаких временных ограничений для предоставления ответа.\n \n    Участники также получают три вида подсказок, чтобы помочь себе, если они застряли на конкретном вопросе.\n \n    Вопросы “Кто хочет стать миллионером?” структурированы в соответствии с пятью различными уровнями, причем уровень сложности постепенно увеличивается. Каждый уровень содержит пять вопросов. Вопросы, сгруппированные на одном уровне, будут иметь одинаковую сложность. Например: вопросы 1-5 составляют первый уровень и будут содержать самые простые вопросы."
	}

	//MARK: - Create UI
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.closeButtonName, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var rulesTitleLabel: UILabel = {
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
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .whiteTitleColor
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
	
	//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .welcomeBackgroundColor
        view.addSubview(closeButton)
        view.addSubview(rulesTitleLabel)
        view.addSubview(rulesTextLabel)
    }
	
	//MARK: - Button function
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
	
	//MARK: - setConstraints
    
    private func setConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.closeButtonTopSpacing),
			closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.closeButtonLeadingSpacing)
        ])
        rulesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			rulesTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.rulesLabelTopSpacing),
            rulesTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        rulesTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			rulesTextLabel.topAnchor.constraint(equalTo: rulesTitleLabel.bottomAnchor, constant: Constants.rulesTextLabelTopSpacing),
			rulesTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.rulesTextLabelSideSpacing),
            rulesTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.rulesTextLabelSideSpacing)
        ])
    }
}



