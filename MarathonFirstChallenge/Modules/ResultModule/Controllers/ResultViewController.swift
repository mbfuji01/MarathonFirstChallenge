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
	
    private lazy var backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background_image")  //Image Background
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var logoImage:UIImageView  = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "logo_image") // this's logo image
        
        return imageView
    }()
    
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("backButton", for: .normal) //Button one
        
        return button
    }()
	//MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
	}
	
	private func setupViews() {
//		view.backgroundColor = .red
	}
	
	private func setConstraints() {
		NSLayoutConstraint.activate([
		
		])
	}
}
