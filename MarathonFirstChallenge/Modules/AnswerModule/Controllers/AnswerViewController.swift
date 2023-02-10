//  AnswerViewController.swift
//  MarathonFirstChallenge

import AVFoundation
import Foundation
import UIKit


class AnswerViewController: UIViewController {
	enum Constants {
		static let backgroundImage: String = "background_image"
		static let defaultButtonBackgroundImage: String = "answer_button_blue"
		static let correctButtonBackgroundImage: String = "answer_button_green"
		static let inCorrectButtonBackgroundImage: String = "answer_button_red"
		static let timerImage: String = "timer_image_regular"
		static let questionNumberText: String = "QUESTION #1"
		static let currentMoneyText: String = "$500"
		static let currentQuestionText: String = "How many continents are there on planet Earth?"
		static let waitingSoundName: String = "waiting"
		static let soundExtension: String = "wav"
		static let helpButtonImage: String = "help_50_50"
		static let audienceButtonImage: String = "help_audience"
		static let callButtonImage: String = "help_call"
		static let timerAlertImage: String = "timer_image_alert"
		static let timerWarningImage: String = "timer_image_warning"
		static let currentMoneyFontSize: CGFloat = 20.0
		static let secondsFontSize: CGFloat = 24.0
		static let currentQuestionFontSize: CGFloat = 24.0
		static let questionNumberLabelTopSpacing: CGFloat = 15.0
		static let currentMoneyLabelTopSpacing: CGFloat = 3.0
		static let timerImageViewTopSpacing: CGFloat = 32.0
		static let timerImageViewWidth: CGFloat = 93.0
		static let timerImageViewHeight: CGFloat = 47.0
		static let secondsLabelXCenter: CGFloat = 17.0
		static let currentQuestionLabelTopSpacing: CGFloat = 24.0
		static let currentQuestionLabelSideSpacing: CGFloat = 30.0
		static let answerButtonStackViewSideSpacing: CGFloat = 30.0
		static let answerButtonStackViewBottomSpacing: CGFloat = 40.0
		static let helpButtonStackViewHeight: CGFloat = 64.0
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
	private lazy var correctAnswer = ""
	let gameBrain = GameBrain()
	
	//MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
		startTime()
		playSound()
		setViewModel()
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
	
	private func setViewModel() {
		let data = gameBrain.getQuestionData()
		currentQuestionLabel.text = data[0]
		oneAnswerButton.text = data[1]
		twoAnswerButton.text = data[2]
		threeAnswerButton.text = data[3]
		fourAnswerButton.text = data[4]
		correctAnswer = data[5]
		questionNumberLabel.text = data[6]
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
	
	//MARK: - GameBrain func
	
	
	
//	private func goToKuda() {
//		if userAnswer == true {
//			goToMainScreen
//		} else if userAnswer == false && badOshibka == true {
//			goToMainScreen
//		} else {
//			goToResult()
//		}
//	}
	
	
	//MARK: - Button Function
	
	@objc private func answerButtonTapped(_ sender: UIButton) {
		// timer 5 sec func with neponatnaya music
		if sender.currentTitle == correctAnswer {
			sender.setBackgroundImage(UIImage(named: Constants.correctButtonBackgroundImage), for: .normal)
			//play good music
		} else {
			sender.setBackgroundImage(UIImage(named: Constants.inCorrectButtonBackgroundImage), for: .normal)
			//play bad music
		}
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
            questionNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.questionNumberLabelTopSpacing)
		])
		currentMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			currentMoneyLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            currentMoneyLabel.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: Constants.currentMoneyLabelTopSpacing)
		])
		timerImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
            timerImageView.topAnchor.constraint(equalTo: currentMoneyLabel.bottomAnchor, constant: Constants.timerImageViewTopSpacing),
			timerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerImageView.widthAnchor.constraint(equalToConstant: Constants.timerImageViewWidth),
            timerImageView.heightAnchor.constraint(equalToConstant: Constants.timerImageViewHeight)
		])
		secondsLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
            secondsLabel.centerXAnchor.constraint(equalTo: timerImageView.centerXAnchor, constant: Constants.secondsLabelXCenter),
			secondsLabel.centerYAnchor.constraint(equalTo: timerImageView.centerYAnchor)
		])
		currentQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			currentQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentQuestionLabel.topAnchor.constraint(equalTo: timerImageView.bottomAnchor, constant: Constants.currentQuestionLabelTopSpacing),
            currentQuestionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.currentQuestionLabelSideSpacing),
			currentQuestionLabel.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -Constants.currentQuestionLabelSideSpacing)
		])
		answerButtonStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
            answerButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.answerButtonStackViewSideSpacing),
			answerButtonStackView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -Constants.answerButtonStackViewSideSpacing),
			answerButtonStackView.widthAnchor.constraint(equalToConstant: view.frame.width-Constants.answerButtonStackViewSideSpacing*2),
            answerButtonStackView.bottomAnchor.constraint(equalTo: helpButtonStackView.topAnchor, constant: -Constants.answerButtonStackViewBottomSpacing)
		])
		helpButtonStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			helpButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			helpButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            helpButtonStackView.heightAnchor.constraint(equalToConstant: Constants.helpButtonStackViewHeight)
		])
	}
}

