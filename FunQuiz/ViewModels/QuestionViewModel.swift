//
//  QuestionModel.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import Foundation

class QuestionViewModel {
    var questionModelArray = [QuestionModel]()
    var currentQuestionIndex = 0
    var score = 0
    
    //This method will increment score by one
    func getUpdatedScoreByOne()-> Int {
        score = score + 1
        return score
    }
    
    //This method will increment current question index by one and conver that value into string
    func updateQuestionIndexByOne()-> String {
        let updatedQuestionindex = currentQuestionIndex + 1
        return String(updatedQuestionindex)
    }
    
    //This method return next question model
    func getNextModel()-> QuestionModel {
        let model = questionModelArray[currentQuestionIndex]
        return model
    }
    
    //This method will increment score by one but not return any value
    func incrementScoreByOne() {
        score = score + 1
    }
    
    //This method increment current question index by one
    func incrementQuestionIndexByOne() {
        currentQuestionIndex = currentQuestionIndex + 1
    }
    
    //This method check wheather given answer is true or false
    func checkResult(answer:Bool)->Bool {
        let model = getNextModel()
         if model.answer == answer {
            return true
         }else {
            return false
        }
    }
    
    //This method check wheather all questions completed or not
    func isQuestionsCompleted()-> Bool {
        if currentQuestionIndex < questionModelArray.count {
            return true
        }else {
            return false
        }
    }
    
    //This method will fetch question data
    func getQuestionData() {
        DataManager.sharedInstance.getQuestionData { (response, error) in
            if error == nil {
                if let questionsDictionary = response[questionsKey] as? [[String: Any]] {
                    for questionDict in questionsDictionary {
                        self.questionModelArray.append(QuestionModel.init(dict: questionDict))
                    }
                }
            }else {
                print("Error occured")
            }
        }
    }
}
