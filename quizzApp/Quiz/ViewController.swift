//
//  ViewController.swift
//  Quiz
//
//  Created by Neill Chua on 2/1/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!


    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!

    
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cognac made?",
                               "What is 7+7?",
                               "What is the capital of Vermont?"]
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    var currentQuestionIndex: Int=0
    
    // react to orientation change
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        // pass future screen width
        updateOffScreenLabel(size.width)
    }
    
    
    func animateLabelTransitions() {
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animateWithDuration(0.5,/// no need to put in duration
                                   delay: 0,
                                   usingSpringWithDamping: 0.3,  /// damping is the "springing"
                                   initialSpringVelocity: 0.4,
                                   options: [.CurveLinear],
                                   animations: {
                                    self.currentQuestionLabel.alpha = 0
                                    self.nextQuestionLabel.alpha = 1
                                    
                                    self.view.layoutIfNeeded()
            },
                                   completion: { _ in
                                    swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                                    swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                                    
                                    self.updateOffScreenLabel(self.view.frame.width)
        })
    }
    
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        animateLabelTransitions()
    }

    @IBAction func showAnswer(sender: AnyObject){
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question
        updateOffScreenLabel(view.frame.width)
        
        
    }
    
    
    //CHANGE: now takes a width argument
    func updateOffScreenLabel(width: CGFloat) {
        nextQuestionLabelCenterXConstraint.constant = -width
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        ///Set the Label's initial Alpha
        
        nextQuestionLabel.alpha = 0
    }
    
}

