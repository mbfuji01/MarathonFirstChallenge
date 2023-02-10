//
//  ResultViewController.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 05.02.2023.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
	enum Constants {
		static let anyVar: String = "anyVar"
	}
	
    
	//MARK: - Create UI
    private lazy var backIsImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "background_image")  //Image Background
   //        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
           
           return imageView
       }()
    
    private lazy var logoIsImage:UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo_image") // this's logo image
        return imageView
        }()
    
    private lazy var upIsButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Сontinue game", for: .normal) //Button one
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(named: "title_yellow_button"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
           return button
       }()
    
    private lazy var downIsButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("New game", for: .normal)
        button.setBackgroundImage(UIImage(named: "title_derk_blue_button"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
       
    private lazy var myUpLabelOne: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
//        label.font = UIFont(name: "Avenir", size: 28)
        label.text = "Who Wants"
        label.numberOfLines = 0
        label.textColor = .white
        return label
        
    }()
    
    private lazy var myUpLabelTwo:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "to be a Millionare"
        label.textColor = .white
        return label
    }()
    
    private lazy var myLittleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.text = "All-time Best Score"
        label.textColor = .systemGray3
        return label
    }()
    
    private lazy var myDownLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.text = "$15,000"
        label.textColor = .white
        return label
    }()
    
    private lazy var teamLabl: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        lable.text = "©TEAM 10"
        lable.textColor = .white
        return lable
    }()
    
	//MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
	}
	
	private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(backIsImageView)
        view.addSubview(logoIsImage)
        view.addSubview(myUpLabelOne)
        view.addSubview(myUpLabelTwo)
        view.addSubview(myLittleLabel)
        view.addSubview(myDownLabel)
        view.addSubview(upIsButton)
        view.addSubview(downIsButton)
        view.addSubview(teamLabl)
        
//        backIsImageView.addSubview(nameButton)

	}
    
    @objc
        private func backButtonTapped() {
            print("backButtonTapped")
        }
	
	private func setConstraints() {
        backIsImageView.frame = view.frame
        logoIsImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
            logoIsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            logoIsImage.widthAnchor.constraint(equalToConstant: 195),
            logoIsImage.heightAnchor.constraint(equalToConstant: 195),
            logoIsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
		])
    
        upIsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upIsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 630),
            upIsButton.widthAnchor.constraint(equalToConstant: 285),
            upIsButton.heightAnchor.constraint(equalToConstant: 50),
            upIsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        downIsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            downIsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 688),
            downIsButton.widthAnchor.constraint(equalToConstant: 285),
            downIsButton.heightAnchor.constraint(equalToConstant: 50),
            downIsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        myUpLabelOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myUpLabelOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 399),
            myUpLabelOne.widthAnchor.constraint(equalToConstant: 168),
            myUpLabelOne.heightAnchor.constraint(equalToConstant: 20),
            myUpLabelOne.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        myUpLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myUpLabelTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
            myUpLabelTwo.widthAnchor.constraint(equalToConstant: 223),
            myUpLabelTwo.heightAnchor.constraint(equalToConstant: 35),
            myUpLabelTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        myLittleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        myLittleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 506),
        myLittleLabel.widthAnchor.constraint(equalToConstant: 127),
        myLittleLabel.heightAnchor.constraint(equalToConstant: 28),
        myLittleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
    ])
        
        myDownLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myDownLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
            myDownLabel.widthAnchor.constraint(equalToConstant: 110),
            myDownLabel.heightAnchor.constraint(equalToConstant: 75),
            myDownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
       ])
        
        
        teamLabl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamLabl.topAnchor.constraint(equalTo: view.topAnchor, constant: 724),
            teamLabl.widthAnchor.constraint(equalToConstant: 54),
            teamLabl.heightAnchor.constraint(equalToConstant: 78),
            teamLabl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
       ])
	}
}
