//
//  DataManager.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 07/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    
    static let sharedInstance = DataManager.init()
    
    //This method will load the json data from bundle
    func getQuestionData(completionBlock: (_ response: [String: Any],_ error: NSError?) -> Void) {
        do {
            if let file = Bundle.main.url(forResource: QuestionsJsonFileName, withExtension: fileExtension) {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    completionBlock(object,nil)
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
