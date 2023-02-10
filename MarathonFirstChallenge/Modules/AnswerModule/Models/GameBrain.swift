//
//  GameBrain.swift
//  MarathonFirstChallenge
//
//  Created by Aleksandra Asichka on 2023-02-08.
//

import Foundation

struct GameBrain {
	var easy = [
		Question(question: "Какой тип хранит только положительные целые числа?",
				 answers: ["UInt", "Int", "Double", "Float"], correctAnswer: "UInt"),
		Question(question: "Можно ли сравнивать две строки?",
				 answers: ["Только !=", "Нет", "Да", "Только =="], correctAnswer: "Да"),
		Question(question: "Может ли подкласс вызывать или получать доступ к методам, свойствам, индексам, принадлежащим своему суперклассу?",
				 answers: ["Нет", "Только вызывать", "Да", "Только получать доступ"], correctAnswer: "Да"),
		Question(question: "Как называется класс, у которого наследуют?",
				 answers: ["Наследник", "Суперкласс", "Класс", "Подкласс"], correctAnswer: "Суперкласс"),
		Question(question: "Как можно инициализировать пустую строку?",
				 answers: ["String[]", "[String]", "(String)", "String()"], correctAnswer: "String()")
	]
	var normal = [
		Question(question: "Какой паттерн помогает одним объектам узнавать об изменении других?",
				 answers: ["Adapter", "Observer", "Proxy", "Delegate"], correctAnswer: "Observer"),
		Question(question: "Каким ключевым словом перечисления обозначаются в коде?",
				 answers: ["func", "enumeration", "struct", "enum"], correctAnswer: "enum"),
		Question(question: "Что из перечисленного является ссылочным типом?",
				 answers: ["Классы", "Свойства", "Структуры", "Перечисления"], correctAnswer: "Классы"),
		Question(question: "Через какое свойство у типа String мы можем узнать, яляется ли строка пустой?",
				 answers: [".removeRange", ".count", ".capacity", ".isEmpty"], correctAnswer: ".isEmpty"),
		Question(question: "Этот оператор управления останавливает выполнение всей инструкции управления потоком",
				 answers: ["continue", "return", "break", "fallthrough"], correctAnswer: "break")
	]
	var hard = [
		Question(question: "Если подкласс переопределяет назначенный инициализатор суперкласса и так же реализует соответсвующий протоколу инициализатор, какими модификаторами его нобходимо обозначить?",
				 answers: ["static и override", "override и mutating", "required и override", "mutating и static"], correctAnswer: "required и override"),
		Question(question: "Какую точность в десятичных знаках имеет тип Float?",
				 answers: ["4 десятичных цифры", "12 десятичных цифр", "6 десятичных цифр", "10 десятичных цифр"], correctAnswer: "6 десятичных цифр"),
		Question(question: "Структурный шаблон проектирования, расширяющий функциональность объекта без использования наследования",
				 answers: ["Command", "Decorator", "Chain Of Responsibility", "Mediator"], correctAnswer: "Decorator"),
		Question(question: "Какой минус есть у паттерна Singleton?",
				 answers: ["Нельзя подключить БД", "Невозможность работы с сетью", "Усложняет чтение кода", "Сложно масштабировать"], correctAnswer: "Сложно масштабировать"),
		Question(question: "Являются ли Swift Array универсальными?",
				 answers: ["Только Dictionary", "Нет", "Да", "Только Array"], correctAnswer: "Да")
	]
	
	var questionLevel = 0
	var newGameQuestion = [Question]()
	var userCanMakeMistake = true
	
	mutating func createQuestionArray() {
        if newGameQuestion.isEmpty {
            easy.shuffle()
            normal.shuffle()
            hard.shuffle()
            newGameQuestion.append(contentsOf: easy)
            newGameQuestion.append(contentsOf: normal)
            newGameQuestion.append(contentsOf: hard)
        }
	}
	
	mutating func resetQuestionArray() {
		newGameQuestion.removeAll()
	}
	
	func getQuestionData() -> [String] {
		return [
			newGameQuestion[questionLevel].question,
			newGameQuestion[questionLevel].answers[0],
			newGameQuestion[questionLevel].answers[1],
			newGameQuestion[questionLevel].answers[2],
			newGameQuestion[questionLevel].answers[3],
			newGameQuestion[questionLevel].correctAnswer,
			"\(questionLevel + 1)"
		]
	}
	
	mutating func checkUserAnswer(userAnswer: String) {
		if userAnswer == newGameQuestion[questionLevel].correctAnswer {
			questionLevel += 1
		} else if userCanMakeMistake {
			questionLevel += 1
			userCanMakeMistake = false
		}
	}
	
	mutating func userAnswerCorrect() {
		questionLevel += 1
	}
}
