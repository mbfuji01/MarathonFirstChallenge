//
//  MainGameTableViewCell.swift
//  MarathonFirstChallenge
//
//  Created by Aleksandra Asichka on 2023-02-06.
//

import UIKit

class MainGameTableViewCell: UITableViewCell {
    
    var imageViewCell = UIImageView()
    var stackViewCell = UIStackView()
    var labelQuestion: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var labelAmountWin: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
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
        imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3).isActive = true
        imageViewCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageViewCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageViewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 3).isActive = true
        imageViewCell.widthAnchor.constraint(equalTo: imageViewCell.widthAnchor, constant: 311).isActive = true
        imageViewCell.heightAnchor.constraint(equalTo: imageViewCell.heightAnchor, constant: 36).isActive = true
    }
    
    func setStackConstraint() {
        stackViewCell.translatesAutoresizingMaskIntoConstraints = false
        stackViewCell.leadingAnchor.constraint(equalTo: imageViewCell.leadingAnchor, constant: 24).isActive = true
        stackViewCell.trailingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: -24).isActive = true
        stackViewCell.topAnchor.constraint(equalTo: imageViewCell.topAnchor).isActive = true
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
