//
//  AnswerButton.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 09.02.2023.
//

import Foundation
import UIKit

class AnswerButton: UIButton {
	var text: String = "" {
		didSet {
			setTitle(text, for: .normal)
		}
	}
	
	init() {
		super.init(frame: .zero)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupViews() {
		setBackgroundImage(UIImage(named: "answer_button_blue"), for: .normal)
		titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		tintColor = .whiteTitleColor
		setTitle("AnswerButton", for: .normal)
	}
}
