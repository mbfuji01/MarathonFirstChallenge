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
    
    private let logoView: UIImageView = {
        let logogView = UIImageView()
        logogView.image = UIImage(named: "logo_image")
        return logogView
    }()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(logoView)
        setupViews()
        setConstraints()
        
       // DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: shouldPerformSegue(withIdentifier: "WelcomeViewController", sender: nil))
        
    }
    
    private func setupViews() {
        
    }
    
    private func setConstraints() {
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.heightAnchor.constraint(equalToConstant: 267),
            logoView.widthAnchor.constraint(equalToConstant: 267),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
