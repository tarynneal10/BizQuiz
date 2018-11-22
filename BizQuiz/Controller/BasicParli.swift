//
//  BasicParli.swift
//  BizQuiz
//
//  Created by Taryn Neal on 11/18/18.
//  Copyright © 2018 Taryn Neal. All rights reserved.
//

import UIKit

class BasicParliViewController: UIViewController {
    let allQuestions = BasicParliQuestionBank()
    let allAnswers = ParliAnswerBank()
    
    var pickedAnswer : String = ""
    var questionNumber : Int = 0
    var score : Int = 0
    var answerANumber : Int = 0
    var answerBNumber : Int = 1
    var answerCNumber : Int = 2
    var answerDNumber : Int = 3

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    //Figure out how to change answer text as well
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.parliList[0]
        let firstAnswerA = allAnswers.parliAnswer[0]
        let firstAnswerB = allAnswers.parliAnswer[1]
        let firstAnswerC = allAnswers.parliAnswer[2]
        let firstAnswerD = allAnswers.parliAnswer[3]
        
        questionLabel.text = firstQuestion.questionText
        answerA.setTitle(firstAnswerA.answerText, for: .normal)
        answerB.setTitle(firstAnswerB.answerText, for: .normal)
        answerC.setTitle(firstAnswerC.answerText, for: .normal)
        answerD.setTitle(firstAnswerD.answerText, for: .normal)
    }
    @IBAction func answerAPressed(_ sender: AnyObject) {
        pickedAnswer = "A"
        answersPressed()
    }
    @IBAction func answerBPressed(_ sender: Any) {
        pickedAnswer = "B"
        answersPressed()
    }
    @IBAction func answerCPressed(_ sender: Any) {
        pickedAnswer = "C"
        answersPressed()
    }
    @IBAction func answerDPressed(_ sender: Any) {
        pickedAnswer = "D"
        answersPressed()
    }
    
    
    func answersPressed() {
        checkAnswer()
        questionNumber = questionNumber + 1
        answerANumber = answerANumber + 4
        answerBNumber = answerBNumber + 4
        answerCNumber = answerCNumber + 4
        answerDNumber = answerDNumber + 4
        nextQuestion()
        changeAnswers()
    }

    func changeAnswers() {
        answerA.setTitle(allAnswers.parliAnswer[answerANumber].answerText, for: .normal)
        answerB.setTitle(allAnswers.parliAnswer[answerBNumber].answerText, for: .normal)
        answerC.setTitle(allAnswers.parliAnswer[answerCNumber].answerText, for: .normal)
        answerD.setTitle(allAnswers.parliAnswer[answerDNumber].answerText, for: .normal)
    }
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"

    }
    
    
    func nextQuestion() {
        
        if questionNumber <= 2{
            
            questionLabel.text = allQuestions.parliList[questionNumber].questionText
        
            updateUI()
            
        }
        else {
            
            let alert = UIAlertController(title: "Awesome", message: "Hey so you finished all the questions... start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.parliList[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
    
            score += 1
        }
        else {
            
        }
    }
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
        
    }

}

