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
    var labelQuestion = UILabel()
    var labelAmountWin = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageViewCell)
        imageViewCell.addSubview(stackViewCell)
        stackViewCell.addArrangedSubview(labelQuestion)
        stackViewCell.addArrangedSubview(labelAmountWin)
        configerLabel()
        configureImageView()
        setImageConstraint()
        setQuestionLabelConstraint()
        setAmountWinLabelConstraint()
        setStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(level: LevelsModel) {
        imageViewCell.image = UIImage(named: level.image)
        labelQuestion.text = "\(level.numberOfQuestion):"
        labelAmountWin.text = "$\(level.winAmount)"
    }
    
    func configureImageView() {
//        imageViewCell.layer.cornerRadius = 10
//        imageViewCell.clipsToBounds = true
        
    }
    
    func configerLabel() {
        labelQuestion.textColor = .white
        labelAmountWin.textColor = .white
        labelAmountWin.textAlignment = .right
        labelQuestion.textAlignment = .left
        labelQuestion.font = UIFont(name: "SF Compact Display", size: 21)
        labelAmountWin.font = UIFont(name: "SF Compact Display", size: 21)
    }
    
    func setImageConstraint() {
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageViewCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageViewCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageViewCell.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageViewCell.widthAnchor.constraint(equalTo: imageViewCell.widthAnchor, constant: 311).isActive = true
    }
    
    func setStack() {
        stackViewCell.translatesAutoresizingMaskIntoConstraints = false
        stackViewCell.leadingAnchor.constraint(equalTo: imageViewCell.leadingAnchor, constant: 20).isActive = true
        stackViewCell.trailingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: -20).isActive = true
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
