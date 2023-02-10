//
//  TeamLabel.swift
//  MarathonFirstChallenge
//
//  Created by Alina Artamonova on 10.02.2023.
//

import Foundation
import UIKit

extension UILabel {
    static var teamMemberLabel: UILabel {
		let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .whiteTitleColor
        label.textAlignment = .left
        return label
    }
}

extension UILabel {
	func blink() {
		self.alpha = 0.0;
		UIView.animate(withDuration: 0.8, //Time duration you want,
							delay: 0.0,
					   options: [.autoreverse, .repeat],
					   animations: { [weak self] in self?.alpha = 1.0 },
					   completion: { [weak self] _ in self?.alpha = 0.0 })
	}
}
