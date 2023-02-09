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
    
    private lazy var nameString: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Game over!", for: .normal)
        return button
    }()
    
    private lazy var nameButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("$15,000", for: .normal)
        return button
    }()
    
    private lazy var upIsButton: UIButton = {
           let button = UIButton(type: .system)
        button.tintColor = .white
           button.setTitle("New Game", for: .normal) //Button one
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(named: "title_yellow_button"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
           return button
       }()
    
    private lazy var downIsButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Main screen", for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
       
       private lazy var myIsLabel: UILabel = {
               let label = UILabel()
               label.text = "$15,000"
               label.textColor = .blue
               return label
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
        view.addSubview(nameString)
        view.addSubview(nameButton)
        view.addSubview(upIsButton)
        view.addSubview(downIsButton)
        
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
            upIsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            upIsButton.widthAnchor.constraint(equalToConstant: 184),
            upIsButton.heightAnchor.constraint(equalToConstant: 50),
            upIsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        downIsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            downIsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 570),
            downIsButton.widthAnchor.constraint(equalToConstant: 290),
            downIsButton.heightAnchor.constraint(equalToConstant: 298),
            downIsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 234),
            nameButton.widthAnchor.constraint(equalToConstant: 340),
            nameButton.heightAnchor.constraint(equalToConstant: 330),
            nameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        nameString.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameString.topAnchor.constraint(equalTo: view.topAnchor, constant: 168),
            nameString.widthAnchor.constraint(equalToConstant: 340),
            nameString.heightAnchor.constraint(equalToConstant: 330),
            nameString.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
	}
}
