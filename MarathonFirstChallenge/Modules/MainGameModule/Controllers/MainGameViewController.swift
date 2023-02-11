//
//  MainGameViewController.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 05.02.2023.
//

import Foundation
import UIKit

class MainGameViewController: UIViewController {
    enum Constants {
        static let levelCell: String = "cell"
        static let backgroundImage: String = "background_image"
        static let logoImage: String = "logo_image"
		static let blueButton: String = "levels_blue_button"
		static let darkButton: String = "levels_dark_blue_button"
		static let greenButton: String = "levels_green_button"
		static let yellowButton: String = "levels_yellow_button"
		static let redButton: String = "answer_button_red"
		static let continueLabelText: String = "Tap to continue"
        static let tableViewTopSpacing: CGFloat = -30.0
        static let tableViewSideSpacing: CGFloat = 32.0
        static let tableViewBottomSpacing: CGFloat = -20.0
        static let tableViewRowHeight: CGFloat = 42.0
        static let logoViewHeight: CGFloat = 85.0
        static let logoViewWidth: CGFloat = 85.0
		static let continueLabelBottomSpacing: CGFloat = 0.0
		static let logoImageViewTopSpacing: CGFloat = 76.0
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
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
	
	private lazy var continueLabel: UILabel = {
		let label = UILabel()
		label.text = Constants.continueLabelText
		label.textColor = .whiteTitleColor
		label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		return label
	}()
    
    private lazy var tableView = UITableView()
    private lazy var actualViewModel: [LevelsModel] = []
   
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaps()
        setupTableViewDelegates()
        setupViews()
        setConstraints()
		createViewModel()
        tableView.register(MainGameTableViewCell.self, forCellReuseIdentifier: Constants.levelCell)
    
        self.navigationController?.isNavigationBarHidden =  false
        
        let backButton = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backViewAction))
            backButton.tintColor = UIColor.white
            self.navigationItem.leftBarButtonItem = backButton
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		continueLabel.blink()
	}
	
    private func setupViews() {
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = Constants.tableViewRowHeight
		
		view.addSubview(backgroundImageView)
		view.addSubview(tableView)
		view.addSubview(logoImageView)
		view.addSubview(continueLabel)
    }
	
	func setupTableViewDelegates() {
		tableView.dataSource = self
		tableView.delegate = self
	}
	
    private func createViewModel() {
        let levelModels = LevelsViewModel().getLevelModels()
        actualViewModel = levelModels
    }
    
	func updateViewModel(for index: Int, correctAnswer: Bool) {
        var levelModels = LevelsViewModel().getLevelModels()
        
		switch correctAnswer {
		case true:
			levelModels[index].image = Constants.greenButton
		case false:
			levelModels[index].image = Constants.redButton
		}
        actualViewModel = levelModels
		tableView.reloadData()
	}
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(routeToAnswer))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
	@objc private func routeToAnswer() {
		//        let answerVC = AnswerViewController()
		//		answerVC.modalPresentationStyle = .fullScreen
		//		present(answerVC, animated: true)
		let answerVC = AnswerViewController()
		self.navigationController?.pushViewController(answerVC, animated: true)
	}
    
	//MARK: - Button function
	
	@objc private func dismissSelf() {
		dismiss(animated: true)
	}
	
	@objc private func backViewAction() {
		navigationController?.popViewController(animated: true)
		navigationController?.isNavigationBarHidden =  true
	}
	
	//MARK: - setConstraints
    
    private func setConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.logoImageViewTopSpacing),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.logoViewWidth),
            logoImageView.heightAnchor.constraint(equalToConstant: Constants.logoViewHeight),
        ])
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Constants.tableViewTopSpacing),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.tableViewBottomSpacing),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.tableViewSideSpacing),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.tableViewSideSpacing)
        ])
		continueLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			continueLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.continueLabelBottomSpacing),
			continueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension MainGameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LevelsViewModel().getLevelModels().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.levelCell, for: indexPath) as! MainGameTableViewCell
        let level = actualViewModel[indexPath.row]
        cell.setViewModel(level: level)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        return cell
    }
}
