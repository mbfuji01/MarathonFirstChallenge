//
//  MainGameViewController.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 05.02.2023.
//

import Foundation
import UIKit

class MainGameViewController: UIViewController {
	enum Constants {
		static let anyVar: String = "anyVar"
        static let testvalue: String = "test"
	}
	
	//MARK: - Create UI
	
	//MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
	}
	
	private func setupViews() {
		view.backgroundColor = .red
	}
	
	private func setConstraints() {
		NSLayoutConstraint.activate([
		
		])
	}
}
