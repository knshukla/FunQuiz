//
//  QuestionsHeaderView.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import UIKit

protocol QuestionsFooterViewDelegate {
    func onNextQuestionButtonTapped()
}
class QuestionsFooterView: UIView {
    
    var resultLabel : UILabel?
    var nextQuestionButton: UIButton?
    var delegate :QuestionsFooterViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    //Initial view setup
    private func configureUI() {
        configureResultLabel()
        configureNextQuestionButton()
    }

    //Initilizing Result label
    private func configureResultLabel() {
        resultLabel = UILabel(frame: CGRect.zero)
        if let _ = resultLabel {
            self.addSubview(resultLabel!)
            resultLabel!.text = questionLabelText
            resultLabel!.font = UIFont.boldSystemFont(ofSize: questionTitleLabelFontSize)
            resultLabel!.textAlignment = .center
            resultLabel!.translatesAutoresizingMaskIntoConstraints = false
            addAutolayoutInResultLabel()
        }
    }
    
    //Adding autolayout in Result label
    private func addAutolayoutInResultLabel() {
        NSLayoutConstraint.activate([
            resultLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: zeroConstant),
            (resultLabel!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: zeroConstant)),
            (resultLabel!.topAnchor.constraint(equalTo: self.topAnchor, constant: resultLabelTopConstraint))
            ])
    }
    
    //Initilizing Next question button
    private func configureNextQuestionButton() {
        nextQuestionButton = UIButton(frame: CGRect.zero)
        if let _ = nextQuestionButton {
            self.addSubview(nextQuestionButton!)
            nextQuestionButton!.setTitle(nextQuestionButtonTitle, for: .normal)
            nextQuestionButton!.setTitleColor(UIColor.blue, for: UIControl.State.normal)
            nextQuestionButton!.addTarget(self, action: #selector(onNextQuestionButtonTapped), for: .touchUpInside)
            nextQuestionButton!.titleLabel?.font = UIFont.boldSystemFont(ofSize: playButtonFontSize)
            nextQuestionButton!.translatesAutoresizingMaskIntoConstraints = false
            addAutolayoutInNextQuestionButton()
        }
    }
    
    //Adding autolayout in next question button
    private func addAutolayoutInNextQuestionButton() {
        NSLayoutConstraint.activate([
            (nextQuestionButton!.centerXAnchor.constraint(equalTo: self.centerXAnchor)),
            (nextQuestionButton!.widthAnchor.constraint(equalToConstant: nextQuestionButtonWidhtConstant)),
            (nextQuestionButton!.topAnchor.constraint(equalTo: self.topAnchor, constant: nextQuestionButtonTopConstraint))
            ])
    }
    
    //Taking action when next question button tapped
    @objc func onNextQuestionButtonTapped(sender: UIButton!) {
        delegate?.onNextQuestionButtonTapped()
    }
}
