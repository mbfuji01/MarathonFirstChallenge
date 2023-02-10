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
