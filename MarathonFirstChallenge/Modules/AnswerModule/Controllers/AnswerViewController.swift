//
//  AnswerViewController.swift
//  MarathonFirstChallenge


import Foundation
import UIKit

class AnswerViewController: UIViewController {
	enum Constants {
        static let backgroundImage: String = "background_image"
        
	}
	
	//MARK: - Create UI
    
    private lazy var backgroundImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.backgroundImage)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var questionNumber: UILabel = {
        let questionNum = UILabel ()
        questionNum.text = "QUESTION #1"
        questionNum.textColor = .white
        questionNum.alpha = 0.5
        return questionNum
    }()
    
    private lazy var allMoney: UILabel = {
        let money = UILabel ()
        money.text = "$500"
        money.textColor = .white
        return money
    }()
    
    private lazy var timer: UIImageView = {
        var secondsTimer = UIImageView()
        secondsTimer.image = UIImage(named: "timer_image_regular")
        secondsTimer.isUserInteractionEnabled = true
        return timer
    }()
    
    private lazy var seconds: UILabel = {
        var time = UILabel ()
        time.text = "24"
        time.textColor = .white
        return time
    }()
    
    private lazy var questionText: UILabel = {
        var text = UILabel ()
        text.text = "How many continents are there on planet Earth?"
        text.textColor = .white
        return text
    }()
    
    
    
    
	
	//MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
	}
	
	private func setupViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(questionNumber)
//        view.addSubview(allMoney)
//        view.addSubview(timer)
//        timer.addSubview(seconds)
//        view.addSubview(questionText)
        
	}
	
	private func setConstraints() {
        backgroundImageView.frame = view.frame
		NSLayoutConstraint.activate([
            
		])
        
        questionNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionNumber.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            questionNumber.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor)
        ])
	}
}
