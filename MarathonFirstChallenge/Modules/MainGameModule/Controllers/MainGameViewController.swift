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
        static let anyVar: String = "anyVar"
        static let levelCell = "cell"
        static let blueButton = "levels_blue_button"
        static let darkButton = "levels_dark_blue_button"
        static let greenButton = "levels_green_button"
        static let yellowButton = "levels_yellow_button"
        static let background = "background_image"
        static let logo = "logo_image"
        
        static let tableViewTopSpacing: CGFloat = -50.0
        static let tableViewLeadingSpacing: CGFloat = 32.0
        static let tableViewTrailingSpacing: CGFloat = -32.0
        static let tableViewBottomSpacing: CGFloat = -20.0
        static let tableViewRowHeight: CGFloat = 42.0
        
        static let logoViewTopSpacing: CGFloat = 40.0
        static let logoViewHeight: CGFloat = 150.0
        static let logoViewWidth: CGFloat = 150.0
        
    }
    
    //MARK: - Create UI
    
    private let backgroundImageView = UIImageView()
    private let logoImageView = UIImageView()
    private let tableView = UITableView()
    private var levels: [LevelsModel] = []
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levels = fetchData()
        setupTableViewDelegetes()
        setupViews()
        setConstraints()
        tableView.register(MainGameTableViewCell.self, forCellReuseIdentifier: Constants.levelCell)
    }
    
    func setupTableViewDelegetes() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(tableView)
        backgroundImageView.addSubview(logoImageView)
        backgroundImageView.image = UIImage(named: Constants.background)
        logoImageView.image = UIImage(named: Constants.logo)
        logoImageView.contentMode = .scaleAspectFill
        tableView.backgroundColor = UIColor.clear
    }
    
    private func setConstraints() {
        tableView.rowHeight = Constants.tableViewRowHeight
        tableView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.logoViewTopSpacing),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.logoViewWidth),
            logoImageView.heightAnchor.constraint(equalToConstant: Constants.logoViewHeight),
        ])
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Constants.tableViewTopSpacing),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.tableViewBottomSpacing),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.tableViewLeadingSpacing),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.tableViewTrailingSpacing)
        ])
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension MainGameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.levelCell, for: indexPath) as! MainGameTableViewCell
        let level = levels[indexPath.row]
        cell.set(level: level)
        cell.backgroundColor = UIColor.clear
        return cell
    }
}

//MARK: - fetchData

extension MainGameViewController {
    func fetchData() -> [LevelsModel] {
        let level1 = LevelsModel(numberOfQuestion: 1, winAmount: 500, image: Constants.darkButton)
        let level2 = LevelsModel(numberOfQuestion: 2, winAmount: 1000, image: Constants.darkButton)
        let level3 = LevelsModel(numberOfQuestion: 3, winAmount: 2000, image: Constants.darkButton)
        let level4 = LevelsModel(numberOfQuestion: 4, winAmount: 3000, image: Constants.darkButton)
        let level5 = LevelsModel(numberOfQuestion: 5, winAmount: 5000, image: Constants.blueButton)
        let level6 = LevelsModel(numberOfQuestion: 6, winAmount: 7500, image: Constants.darkButton)
        let level7 = LevelsModel(numberOfQuestion: 7, winAmount: 1000, image: Constants.darkButton)
        let level8 = LevelsModel(numberOfQuestion: 8, winAmount: 12500, image: Constants.darkButton)
        let level9 = LevelsModel(numberOfQuestion: 9, winAmount: 15000, image: Constants.darkButton)
        let level10 = LevelsModel(numberOfQuestion: 10, winAmount: 25_000, image: Constants.blueButton)
        let level11 = LevelsModel(numberOfQuestion: 11, winAmount: 50_000, image: Constants.darkButton)
        let level12 = LevelsModel(numberOfQuestion: 12, winAmount: 100_000, image: Constants.darkButton)
        let level13 = LevelsModel(numberOfQuestion: 13, winAmount: 250_000, image: Constants.darkButton)
        let level14 = LevelsModel(numberOfQuestion: 14, winAmount: 500_000, image: Constants.darkButton)
        let level15 = LevelsModel(numberOfQuestion: 15, winAmount: 1_000_000, image: Constants.yellowButton)
        return [level15, level14, level13, level12, level11, level10, level9, level8, level7, level6, level5, level4, level3, level2, level1]
    }
}
