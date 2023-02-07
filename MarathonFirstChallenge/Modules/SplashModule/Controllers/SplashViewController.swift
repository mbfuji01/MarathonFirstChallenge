//
//  SplashViewController.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 06.02.2023.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    enum Constants {
        static let anyVar: String = "anyVar"
    }
    
    //MARK: - Create UI
    
    private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "background_image")
            return imageView
        }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        //view.backgroundColor = .red
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }
}
