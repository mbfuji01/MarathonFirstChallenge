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
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.background)
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.logo)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var tableView = UITableView()
    private lazy var levels: [LevelsModel] = []
    private lazy var data = FetchDataModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levels = data.fetchData()
        setupTableViewDelegetes()
        setupViews()
        setConstraints()
        tableView.register(MainGameTableViewCell.self, forCellReuseIdentifier: Constants.levelCell)
        tableView.rowHeight = Constants.tableViewRowHeight
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow_back"), style: .plain, target: self, action: #selector(dismissSelf))
    }
    
    func setupTableViewDelegetes() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(tableView)
        backgroundImageView.addSubview(logoImageView)
        tableView.backgroundColor = UIColor.clear
    }
    
    private func setConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.logoViewTopSpacing),
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.tableViewLeadingSpacing),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.tableViewTrailingSpacing)
        ])
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true)
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
