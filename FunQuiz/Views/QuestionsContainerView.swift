//
//  QuestionsHeaderView.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import UIKit

protocol QuestionsContainerViewDelegate {
    func onTrueButtonTapped()
    func onFalseButtonTapped()
}

class QuestionsContainerView: UIView {
    
    var questionLabel : UILabel?
    var trueButton: UIButton?
    var falseButton: UIButton?
    var delegate: QuestionsContainerViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    //Initilizing initial Views by calling all initilization methods
    private func configureUI() {
        configureQuestionLabel()
        configureTrueButton()
        configureFalseButton()
    }

    //initilizing question label
    private func configureQuestionLabel() {
        questionLabel = UILabel(frame: CGRect.zero)
        if let _ = questionLabel {
            self.addSubview(questionLabel!)
            questionLabel!.font = UIFont.systemFont(ofSize: questionTitleLabelFontSize)
            questionLabel!.textAlignment = .center
            questionLabel!.numberOfLines = questionNoOfLines
            questionLabel!.translatesAutoresizingMaskIntoConstraints = false
            addAutolayoutInQuestionLabel()
        }
    }
    
    //Adding autolayout in Question label
    private func addAutolayoutInQuestionLabel() {
        NSLayoutConstraint.activate([
            questionLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: questionLabelLeadingConstraint),
            questionLabel!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: questionLabelTrailingConstraint),
            questionLabel!.topAnchor.constraint(equalTo: self.topAnchor, constant: questionLabelTopConstraint)
            ])
    }
    
    //Initilizing true button
    private func configureTrueButton() {
        trueButton = UIButton(frame: CGRect.zero)
        if let _ = trueButton {
            self.addSubview(trueButton!)
            trueButton!.setTitle(trueButtonTitle, for: .normal)
            trueButton!.setTitleColor(UIColor.blue, for: UIControl.State.normal)
            trueButton!.addTarget(self, action: #selector(onTrueButtonTapped), for: .touchUpInside)
            trueButton!.titleLabel?.font = UIFont.boldSystemFont(ofSize: playButtonFontSize)
            trueButton!.translatesAutoresizingMaskIntoConstraints = false
            addAutolayoutInTrueButton()
        }
    }
    
    //Adding autolayout in true button
    private func addAutolayoutInTrueButton() {
        NSLayoutConstraint.activate([
            (trueButton!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: trueButtonLeadingConstraint)),
            (trueButton!.widthAnchor.constraint(equalToConstant: trueButtonWidhtConstant)),
            (trueButton!.topAnchor.constraint(equalTo: (questionLabel?.bottomAnchor)!, constant: trueButtonTopConstraint))
            ])
    }

    @objc func onTrueButtonTapped(sender: UIButton!) {
        delegate?.onTrueButtonTapped()
    }
    
    //Initlizing false button
    private func configureFalseButton() {
        falseButton = UIButton(frame: CGRect.zero)
        if let _ = falseButton {
            self.addSubview(falseButton!)
            falseButton!.setTitle(falseButtonTitle, for: .normal)
            falseButton!.setTitleColor(UIColor.blue, for: UIControl.State.normal)
            falseButton!.addTarget(self, action: #selector(onFalseButtonTapped), for: .touchUpInside)
            falseButton!.titleLabel?.font = UIFont.boldSystemFont(ofSize: playButtonFontSize)
            falseButton!.translatesAutoresizingMaskIntoConstraints = false
            addAutolayoutInFalseButton()
        }
    }
    
    //Adding autolayout in false button
    private func addAutolayoutInFalseButton() {
        NSLayoutConstraint.activate([
            (falseButton!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: falseButtonTrailingConstraint)),
            (falseButton!.widthAnchor.constraint(equalToConstant: trueButtonWidhtConstant)),
            (falseButton!.topAnchor.constraint(equalTo: (questionLabel?.bottomAnchor)!, constant: falseButtonTopConstraint))
            ])
    }
    
    @objc func onFalseButtonTapped(sender: UIButton!) {
        delegate?.onFalseButtonTapped()
    }
}

