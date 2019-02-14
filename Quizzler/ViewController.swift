//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestion.list[0]
        questionLabel.text = firstQuestion.questionText
        
        updateUI()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        nextQuestion()
  
    }
    
    
    func updateUI() {
        progressLabel.text = "\(questionNumber + 1) / 14"
        scoreLabel.text = "Score: \(score)"
        progressBar.frame.size.width = (view.frame.size.width / 14) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        if questionNumber <= 13 {
            questionLabel.text = allQuestion.list[questionNumber].questionText
            updateUI()
        }
        else{
           
            // Creating ALERT BOX-----------------------------------------------------------------------------------------------
            
            let alert = UIAlertController(title: "Congratulation", message: "You have completed the game. You wish to start over ?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            }))
            
            self.present(alert,animated: true)
            
        }
    }
    
    
    func checkAnswer() {
        
        let answer = allQuestion.list[questionNumber].answer
        
//        if answer == pickedAnswer{
//            print("You got it!")
//            score += 1
//            updateUI()
//            ProgressHUD.showSuccess("Correct")
//        }
//        else
//        {
//            print("Wrong!")
//            ProgressHUD.showError("Wrong")
//        }
//
        
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        //updateUI()
        nextQuestion()
    }
    

    
}
