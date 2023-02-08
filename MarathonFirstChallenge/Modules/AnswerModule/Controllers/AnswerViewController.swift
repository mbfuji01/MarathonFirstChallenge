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
        money.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return money
    }()
    
    private lazy var timerImage: UIImageView = {
        var secondsTimer = UIImageView()
        secondsTimer.image = UIImage(named: "timer_image_regular")
        return secondsTimer
    }()
    
    private lazy var seconds: UILabel = {
        var time = UILabel ()
        time.text = "24"
        time.textColor = .white
        time.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        return time
    }()
    
    private lazy var questionText: UILabel = {
        var text = UILabel ()
        text.text = "How many continents are there on planet Earth?"
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        text.numberOfLines = 0
        text.textAlignment = .center
        return text
    }()
    
    private lazy var answerButton1: UIButton = {
        let button1 = UIButton(type: .system)
        button1.setBackgroundImage(UIImage(named: "answer_button_blue"), for: .normal)
        button1.setTitle("A: Answer1", for: .normal)
        button1.tintColor = .white
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button1.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button1
    }()
    
    private lazy var answerButton2: UIButton = {
        let button2 = UIButton(type: .system)
        button2.setBackgroundImage(UIImage(named: "answer_button_blue"), for: .normal)
        button2.setTitle("B: Answer2", for: .normal)
        button2.tintColor = .white
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button2.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button2
    }()
    private lazy var answerButton3: UIButton = {
        let button3 = UIButton(type: .system)
        button3.setBackgroundImage(UIImage(named: "answer_button_blue"), for: .normal)
        button3.setTitle("C: Answer3", for: .normal)
        button3.tintColor = .white
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button3.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button3
    }()
    private lazy var answerButton4: UIButton = {
        let button4 = UIButton(type: .system)
        button4.setBackgroundImage(UIImage(named: "answer_button_blue"), for: .normal)
        button4.setTitle("D: Answer4", for: .normal)
        button4.tintColor = .white
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button4.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button4
    }()
    private lazy var answerButtonStackView = UIStackView()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    private func setupViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(questionNumber)
        backgroundImageView.addSubview(allMoney)
        backgroundImageView.addSubview(timerImage)
        timerImage.addSubview(seconds)
        backgroundImageView.addSubview(questionText)
        backgroundImageView.addSubview(answerButton1)
        backgroundImageView.addSubview(answerButton2)
        backgroundImageView.addSubview(answerButton3)
        backgroundImageView.addSubview(answerButton4)
        
        
        answerButtonStackView = UIStackView(arrangedSubviews: [answerButton1, answerButton2, answerButton3, answerButton4], axis: .vertical, spacing: 5)
        
        
    }
    @objc private func backButtonTapped (){
        
    }
    
    
    private func setConstraints() {
        backgroundImageView.frame = view.frame
        NSLayoutConstraint.activate([
        ])
        
        questionNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionNumber.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            questionNumber.topAnchor.constraint(equalTo: backgroundImageView.safeAreaLayoutGuide.topAnchor, constant: 15)
        ])
        
        allMoney.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            allMoney.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            allMoney.topAnchor.constraint(equalTo: questionNumber.bottomAnchor, constant: 3)
        ])
        
        timerImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timerImage.topAnchor.constraint(equalTo: allMoney.bottomAnchor, constant: 40),
            timerImage.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            timerImage.widthAnchor.constraint(equalToConstant: 93),
            timerImage.heightAnchor.constraint(equalToConstant: 47)
        ])
        
        seconds.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seconds.centerXAnchor.constraint(equalTo: timerImage.centerXAnchor, constant: 17),
            seconds.centerYAnchor.constraint(equalTo: timerImage.centerYAnchor)
        ])
        
        questionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionText.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            questionText.topAnchor.constraint(equalTo: timerImage.bottomAnchor, constant: 40),
            //questionText.widthAnchor.constraint(equalToConstant: 60),
            questionText.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 30),
            questionText.trailingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: -30)
            
        ])
        //        answerButton1.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            answerButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            answerButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //
        //        ])
        
        //        answerButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            answerButtonStackView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
        //            answerButtonStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 30),
        //            answerButtonStackView.trailingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: -30)
        //            ])
        //	}
        //
        
    }
}

