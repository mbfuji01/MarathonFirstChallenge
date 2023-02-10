//
//  File.swift
//  MarathonFirstChallenge
//
//  Created by Aleksandra Asichka on 2023-02-08.
//

import Foundation

struct Question {
	let question: String
	let answers: [String]
	let correctAnswer: String
	
	init(question: String, answers: [String], correctAnswer: String) {
		self.question = question
		self.answers = answers
		self.correctAnswer = correctAnswer
	}
}
