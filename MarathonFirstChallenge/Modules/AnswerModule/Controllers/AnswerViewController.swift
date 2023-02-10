//  AnswerViewController.swift
//  MarathonFirstChallenge

import AVFoundation
import Foundation
import UIKit


class AnswerViewController: UIViewController {
	enum Constants {
		static let backgroundImage: String = "background_image"
		static let timerImage: String = "timer_image_regular"
		static let questionNumberText: String = "QUESTION #1"
		static let currentMoneyText: String = "$500"
		static let currentQuestionText: String = "How many continents are there on planet Earth?"
		static let currentMoneyFontSize: CGFloat = 20
		static let secondsFontSize: CGFloat = 24
		static let currentQuestionFontSize: CGFloat = 24
		static let waitingSoundName: String = "waiting"
		static let soundExtension: String = "wav"
		static let helpButtonImage: String = "help_50_50"
		static let audienceButtonImage: String = "help_audience"
		static let callButtonImage: String = "help_call"
		static let timerAlertImage: String = "timer_image_alert"
		static let timerWarningImage: String = "timer_image_warning"
	}

	//MARK: - Create UI
	
	private lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Constants.backgroundImage)
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()
	private lazy var questionNumberLabel: UILabel = {
		let questionNum = UILabel ()
		questionNum.text = Constants.questionNumberText
		questionNum.textColor = .descriptionTitleColor
		return questionNum
	}()
	private lazy var currentMoneyLabel: UILabel = {
		let money = UILabel ()
		money.text = Constants.currentMoneyText
		money.textColor = .whiteTitleColor
		money.font = UIFont.systemFont(ofSize: Constants.currentMoneyFontSize)
		return money
	}()
	private lazy var timerImageView: UIImageView = {
		var secondsTimer = UIImageView()
		secondsTimer.image = UIImage(named: Constants.timerImage)
		return secondsTimer
	}()
	private lazy var secondsLabel: UILabel = {
		var time = UILabel ()
		time.textColor = .whiteTitleColor
		time.font = UIFont.systemFont(ofSize: Constants.secondsFontSize, weight: .semibold)
		return time
	}()
	private lazy var currentQuestionLabel: UILabel = {
		var text = UILabel ()
		text.text = Constants.currentQuestionText
		text.textColor = .whiteTitleColor
		text.font = UIFont.systemFont(ofSize: Constants.currentQuestionFontSize, weight: .semibold)
		text.numberOfLines = 0
		text.textAlignment = .center
		return text
	}()
	
	private lazy var oneAnswerButton: AnswerButton = {
		let button = AnswerButton()
		button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
		return button
	}()
	private lazy var twoAnswerButton: AnswerButton = {
		let button = AnswerButton()
		button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
		return button
	}()
	private lazy var threeAnswerButton: AnswerButton = {
		let button = AnswerButton()
		button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
		return button
	}()
	private lazy var fourAnswerButton: AnswerButton = {
		let button = AnswerButton()
		button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
		return button
	}()
	
	private lazy var helpButton: UIButton = {
		let button = UIButton (type: .system)
		button.setBackgroundImage(UIImage(named: Constants.helpButtonImage), for: .normal)
		button.addTarget(self, action: #selector(helpButtonTapped), for: .touchUpInside)
		return button
	}()
	private lazy var audienceButton: UIButton = {
		let button = UIButton (type: .system)
		button.setBackgroundImage(UIImage(named: Constants.audienceButtonImage), for: .normal)
		button.addTarget(self, action: #selector(audienceButtonTapped), for: .touchUpInside)
		return button
	}()
	private lazy var callButton: UIButton = {
		let button = UIButton (type: .system)
		button.setBackgroundImage(UIImage(named: Constants.callButtonImage), for: .normal)
		button.addTarget(self, action: #selector(callButtonTapped), for: .touchUpInside)
		return button
	}()
	
	private lazy var answerButtonStackView = UIStackView()
	private lazy var helpButtonStackView = UIStackView()
	
	//MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
//		startTime()
//		playSound()
	}
	
	private func setupViews() {
		answerButtonStackView = UIStackView(arrangedSubviews: [
			oneAnswerButton,
			twoAnswerButton,
			threeAnswerButton,
			fourAnswerButton
		], axis: .vertical, spacing: 15)
		
		helpButtonStackView = UIStackView(arrangedSubviews: [
			helpButton,
			audienceButton,
			callButton
		], axis: .horizontal, spacing: 20)
		view.addSubview(backgroundImageView)
		view.addSubview(questionNumberLabel)
		view.addSubview(currentMoneyLabel)
		view.addSubview(timerImageView)
		timerImageView.addSubview(secondsLabel)
		view.addSubview(currentQuestionLabel)
		view.addSubview(answerButtonStackView)
		view.addSubview(helpButtonStackView)
	}
	
	//MARK: - Music
	
	var player: AVAudioPlayer!
	func playSound() {
		let url = Bundle.main.url(forResource: Constants.waitingSoundName, withExtension: Constants.soundExtension)
		player = try! AVAudioPlayer(contentsOf: url!)
		player.play()
	}

	//MARK: - Timer

	var timeForAnswer = 31
	var timer = Timer()

	@objc func startTime() {
		timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(AnswerViewController.updateTimer)), userInfo: nil, repeats: true)
	}

	@objc func updateTimer() {
		if timeForAnswer > 0 {
			timeForAnswer -= 1
		}else{
			timeForAnswer = 0
		}

		secondsLabel.text = "\(timeForAnswer)"

		switch timeForAnswer {
		case 15:
			timerImageView.image = UIImage(named: Constants.timerAlertImage)
			secondsLabel.textColor = .timerItemYellowColor
		case 5:
			timerImageView.image = UIImage(named: Constants.timerWarningImage)
			secondsLabel.textColor = .timerItemRedColor
		default:break
		}
	}
	
	//MARK: - Button Function
	
	@objc private func answerButtonTapped(_ sender: UIButton) {
		print(sender.currentTitle!)
	}
	
	@objc private func helpButtonTapped() {
		print("helpButtonTapped")
	}
	
	@objc private func audienceButtonTapped() {
		print("audienceButtonTapped")
	}
	
	@objc private func callButtonTapped() {
		print("callButtonTapped")
	}
	
	//MARK: - setConstraints
	
	private func setConstraints() {
		backgroundImageView.frame = view.frame
		
		questionNumberLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			questionNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			questionNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
		])
		currentMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			currentMoneyLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
			currentMoneyLabel.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 3)
		])
		timerImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			timerImageView.topAnchor.constraint(equalTo: currentMoneyLabel.bottomAnchor, constant: 32),
			timerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			timerImageView.widthAnchor.constraint(equalToConstant: 93),
			timerImageView.heightAnchor.constraint(equalToConstant: 47)
		])
		secondsLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			secondsLabel.centerXAnchor.constraint(equalTo: timerImageView.centerXAnchor, constant: 17),
			secondsLabel.centerYAnchor.constraint(equalTo: timerImageView.centerYAnchor)
		])
		currentQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			currentQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			currentQuestionLabel.topAnchor.constraint(equalTo: timerImageView.bottomAnchor, constant: 24),
			currentQuestionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			currentQuestionLabel.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30)
		])
		answerButtonStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			answerButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			answerButtonStackView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30),
			answerButtonStackView.widthAnchor.constraint(equalToConstant: view.frame.width-60),
			answerButtonStackView.bottomAnchor.constraint(equalTo: helpButtonStackView.topAnchor, constant: -40)
		])
		helpButtonStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			helpButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			helpButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			helpButtonStackView.heightAnchor.constraint(equalToConstant: 64)
		])
	}
}

