//
//  TeamLabel.swift
//  MarathonFirstChallenge
//
//  Created by Alina Artamonova on 10.02.2023.
//

import Foundation
import UIKit

extension UILabel{
    static var teamMemberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .whiteTitleColor
        label.textAlignment = .center
        return label
    }()
}
