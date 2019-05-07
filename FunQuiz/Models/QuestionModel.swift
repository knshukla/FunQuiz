//
//  QuestionModel.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import Foundation

struct QuestionModel {
    
    var question: String?
    var answer: Bool?
    
    //Constructor for Question model which takes dict and initilize the model
    init(dict: [String : Any]) {
        if let question = dict[questionKey] as? String {
            self.question = question
        }
        if let answer = dict[answerKey] as? Bool {
            self.answer = answer
        }
        
    }
}
