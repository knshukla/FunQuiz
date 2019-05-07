//
//  FunQuizTests.swift
//  FunQuizTests
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import XCTest
@testable import FunQuiz

class FunQuizTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //This test case check wheater score increment is working proper or not
        let questionViewModel = QuestionViewModel()
        questionViewModel.incrementScoreByOne()
        XCTAssert(questionViewModel.score == 1 , "Score is not incrementing correctly")
        
        //This test case check wheather question data fetched properly or not
        questionViewModel.getQuestionData()
        XCTAssert(questionViewModel.questionModelArray.count > 0 , "Question data not fetched successfully")
        
        //This test case check wheather answer matching algo working fine or not
        for _ in questionViewModel.questionModelArray {
            XCTAssert(questionViewModel.checkResult(answer: true), "Answer matching method is not working correctly")
        }
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
