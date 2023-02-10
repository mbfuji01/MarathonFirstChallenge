//
//  LevelsModel.swift
//  MarathonFirstChallenge
//
//  Created by Aleksandra Asichka on 2023-02-06.
//

import Foundation

struct LevelsModel {
	var numberOfQuestion: Int
	var winAmount: Int
	var image: String
}

class LevelsViewModel {
	enum Constants {
		static let blueButton = "levels_blue_button"
		static let darkButton = "levels_dark_blue_button"
		static let greenButton = "levels_green_button"
		static let yellowButton = "levels_yellow_button"
		static let redButton = "answer_button_red"
	}
	
	private var levelModels = [
        LevelsModel(numberOfQuestion: 15, winAmount: 1_000_000, image: Constants.yellowButton),
        LevelsModel(numberOfQuestion: 14, winAmount: 500_000, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 13, winAmount: 250_000, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 12, winAmount: 100_000, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 11, winAmount: 50_000, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 10, winAmount: 25_000, image: Constants.blueButton),
        LevelsModel(numberOfQuestion: 9, winAmount: 15000, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 8, winAmount: 12500, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 7, winAmount: 1000, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 6, winAmount: 7500, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 5, winAmount: 5000, image: Constants.blueButton),
        LevelsModel(numberOfQuestion: 4, winAmount: 3000, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 3, winAmount: 2000, image: Constants.darkButton),
		LevelsModel(numberOfQuestion: 2, winAmount: 1000, image: Constants.darkButton),
        LevelsModel(numberOfQuestion: 1, winAmount: 500, image: Constants.darkButton)
	]
	
	func getLevelModels() -> [LevelsModel] {
		return levelModels
	}
}
