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
        static let stackViewLeadingSpasing = 24.0
        static let stackViewTrailingSpasing = -24.0
    }
 
    //MARK: - Create UI
    
    private lazy var imageViewCell = UIImageView()
    private lazy var stackViewCell = UIStackView()
    private lazy var labelQuestion: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .semibold)
        return label
    }()
    
    private lazy var labelAmountWin: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .semibold)
        return label
    }()
    
    //MARK: - Setting Cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(imageViewCell)
        imageViewCell.addSubview(stackViewCell)
        stackViewCell.addArrangedSubview(labelQuestion)
        stackViewCell.addArrangedSubview(labelAmountWin)
    }
    
    private func setConstraints() {
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.borderCellSize),
            imageViewCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageViewCell.topAnchor.constraint(equalTo: topAnchor),
            imageViewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.borderCellSize)
        ])
        labelQuestion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelQuestion.leadingAnchor.constraint(equalTo: stackViewCell.leadingAnchor),
            labelQuestion.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        labelAmountWin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelAmountWin.trailingAnchor.constraint(equalTo: stackViewCell.trailingAnchor),
            labelAmountWin.topAnchor.constraint(equalTo: stackViewCell.topAnchor)
        ])
        stackViewCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewCell.leadingAnchor.constraint(equalTo: imageViewCell.leadingAnchor, constant: Constants.stackViewLeadingSpasing),
            stackViewCell.trailingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: Constants.stackViewTrailingSpasing),
            stackViewCell.topAnchor.constraint(equalTo: imageViewCell.topAnchor),
            stackViewCell.bottomAnchor.constraint(equalTo: imageViewCell.bottomAnchor)
        ])
    }
    
    func set(level: LevelsModel) {
        imageViewCell.image = UIImage(named: level.image)
        labelQuestion.text = "\(level.numberOfQuestion):"
        labelAmountWin.text = "$\(level.winAmount)"
    }
}
