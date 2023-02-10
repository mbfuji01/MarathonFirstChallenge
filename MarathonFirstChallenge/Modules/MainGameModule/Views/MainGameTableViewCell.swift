//
//  MainGameTableViewCell.swift
//  MarathonFirstChallenge
//
//  Created by Aleksandra Asichka on 2023-02-06.
//

import UIKit

class MainGameTableViewCell: UITableViewCell {
    enum Constants {
        static let labelFontSize = 18.0
        static let borderCellSize = 3.0
        static let stackViewSideSpacing = 24.0
    }
 
    //MARK: - Create UI
    
    private lazy var cellImageView = UIImageView()
    private lazy var cellStackView = UIStackView()
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .whiteTitleColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .semibold)
        return label
    }()
    
    private lazy var winAmountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .semibold)
        return label
    }()
    
	//MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	private func setupViews() {
		addSubview(cellImageView)
		cellImageView.addSubview(cellStackView)
		cellStackView.addArrangedSubview(questionLabel)
		cellStackView.addArrangedSubview(winAmountLabel)
	}
	
	//MARK: - Setup Cell
    
    func setViewModel(level: LevelsModel) {
        cellImageView.image = UIImage(named: level.image)
        questionLabel.text = "\(level.numberOfQuestion):"
        winAmountLabel.text = "$\(level.winAmount)"
    }
    
    private func setConstraints() {
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.borderCellSize),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.borderCellSize)
        ])
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        winAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            winAmountLabel.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor),
            winAmountLabel.topAnchor.constraint(equalTo: cellStackView.topAnchor)
        ])
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellStackView.leadingAnchor.constraint(equalTo: cellImageView.leadingAnchor, constant: Constants.stackViewSideSpacing),
            cellStackView.trailingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: -Constants.stackViewSideSpacing),
            cellStackView.topAnchor.constraint(equalTo: cellImageView.topAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: cellImageView.bottomAnchor)
        ])
    }
}
