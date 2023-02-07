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
    
    var imageViewCell = UIImageView()
    var stackViewCell = UIStackView()
    var labelQuestion: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .semibold)
        return label
    }()
    
    var labelAmountWin: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageViewCell)
        imageViewCell.addSubview(stackViewCell)
        stackViewCell.addArrangedSubview(labelQuestion)
        stackViewCell.addArrangedSubview(labelAmountWin)
    }
    
    func setConstraints() {
        setImageConstraint()
        setQuestionLabelConstraint()
        setAmountWinLabelConstraint()
        setStackConstraint()
    }
    
    func set(level: LevelsModel) {
        imageViewCell.image = UIImage(named: level.image)
        labelQuestion.text = "\(level.numberOfQuestion):"
        labelAmountWin.text = "$\(level.winAmount)"
    }
    
    func setImageConstraint() {
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.borderCellSize).isActive = true
        imageViewCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageViewCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageViewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.borderCellSize).isActive = true
    }
    
    func setStackConstraint() {
        stackViewCell.translatesAutoresizingMaskIntoConstraints = false
        stackViewCell.leadingAnchor.constraint(equalTo: imageViewCell.leadingAnchor, constant: Constants.stackViewLeadingSpasing).isActive = true
        stackViewCell.trailingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: Constants.stackViewTrailingSpasing).isActive = true
        stackViewCell.topAnchor.constraint(equalTo: imageViewCell.topAnchor).isActive = true
        stackViewCell.bottomAnchor.constraint(equalTo: imageViewCell.bottomAnchor).isActive = true
    }
    
    func setQuestionLabelConstraint() {
        labelQuestion.leadingAnchor.constraint(equalTo: stackViewCell.leadingAnchor).isActive = true
        labelQuestion.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setAmountWinLabelConstraint() {
        labelAmountWin.trailingAnchor.constraint(equalTo: stackViewCell.trailingAnchor).isActive = true
        labelAmountWin.topAnchor.constraint(equalTo: stackViewCell.topAnchor).isActive = true
    }
}
