//
//  QuestionsViewController.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    let questionViewModel =  QuestionViewModel()
    var headerView: QuestionsHeaderView?
    var footerView: QuestionsFooterView?
    var questionContainerView: QuestionsContainerView?
    
    // MARK: ViewController life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialViewConfiguration()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension QuestionsViewController {
    // MARK: LocalMethods

    //Calling all methods which requires to initilize UI
    private func loadInitialViewConfiguration() {
        configureHeaderView()
        configureBottomFooterView()
        configureQuestionContainerView()
        getQuestionData()
        updateUI()
    }
    
    //Fetch question data
    private func getQuestionData() {
        questionViewModel.getQuestionData()
    }
    
    //Creating score label
    private func configureHeaderView() {
        headerView = configureTopHeaderView()
    }
    
    //Initilizing footer view
    private func configureBottomFooterView() {
        footerView = configureFooterView()
        showHideFooterView(isHidden: true)
    }
    
    //Hiding footer view
    private func showHideFooterView(isHidden:Bool) {
        footerView?.isHidden = isHidden
    }
    
    //Updaing questiong Number on header
    private func updateQuestionNumber() {
        let questionNumberString = questionTitle + questionViewModel.updateQuestionIndexByOne()
        headerView?.questionTitleLabel?.text = questionNumberString
    }
    
    //Updating next question and question number
    private func updateUI() {
        if questionViewModel.isQuestionsCompleted() {
            let model = questionViewModel.getNextModel()
            questionContainerView?.questionLabel?.text = model.question
            updateQuestionNumber()
        }
    }
    
    //Enabling disabling true false button
    func enableDisableTrueFalseButton(isEnable:Bool) {
        questionContainerView?.trueButton?.isEnabled = isEnable
        questionContainerView?.falseButton?.isEnabled = isEnable
    }
    
    //Checking question correct or not
    private func checkResult(givenAnswer: Bool) {
        showHideFooterView(isHidden: false)
        enableDisableTrueFalseButton(isEnable:false)
        if questionViewModel.checkResult(answer: givenAnswer) {
            footerView?.resultLabel?.text = correctQuestionTitle
            questionViewModel.incrementScoreByOne()
        }else {
            footerView?.resultLabel?.text = wrongQuestionTitle
        }
    }
    
    //Adding autolayout in container view
    func addAutoLayoutInContainerView() {
        NSLayoutConstraint.activate([
            questionContainerView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: zeroConstant),
            questionContainerView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: zeroConstant),
            questionContainerView!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: questionContainerViewTopConstraint),
            questionContainerView!.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: questionContainerViewBottomConstraint)
            ])
    }
    
    //initilizing question container view
    private func configureQuestionContainerView() {
        questionContainerView = UIView.fromNib()
        if let _ = questionContainerView {
            questionContainerView!.translatesAutoresizingMaskIntoConstraints = false
            questionContainerView!.delegate = self
            self.view.addSubview(questionContainerView!)
            addAutoLayoutInContainerView()
        }
    }
    
    //Updating score
    private func updateScore() {
        NotificationCenter.default.post(name: Notification.Name.init(ScoreUpdateNotification), object: questionViewModel)
    }
}

extension  QuestionsViewController: QuestionsHeaderViewDelegate,QuestionsFooterViewDelegate {
    // MARK: Footer and Header delegate methods

    //Action when done button tapped, dismissing question controller
    func onDoneButtonTapped() {
        self.updateScore()
        self.dismiss(animated: true, completion: {})
    }
    
    //Taking action when next question button tapped
    func onNextQuestionButtonTapped() {
        showHideFooterView(isHidden: true)
        enableDisableTrueFalseButton(isEnable:true)
        questionViewModel.incrementQuestionIndexByOne()
        if questionViewModel.isQuestionsCompleted() {
            updateUI()
        }else {
            questionContainerView?.trueButton?.isHidden = true
            questionContainerView?.falseButton?.isHidden = true
            questionContainerView?.questionLabel?.text = quizCompletedText
            headerView?.questionTitleLabel?.text = completedText
        }
    }
}

extension QuestionsViewController: QuestionsContainerViewDelegate {
    // MARK: ContainerView delegate methods

    func onFalseButtonTapped() {
        checkResult(givenAnswer:false)
    }
    
    func onTrueButtonTapped() {
        checkResult(givenAnswer:true)
    }
}
