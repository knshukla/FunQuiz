//
//  QuestionsHeaderView.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import UIKit

protocol QuestionsHeaderViewDelegate {
    func onDoneButtonTapped()
}

class QuestionsHeaderView: UIView {
    
    var questionTitleLabel : UILabel?
    var doneButton: UIButton?
    var delegate: QuestionsHeaderViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    //Initial setup
    private func configureUI() {
        configureScoreLabel()
        configureDoneButton()
    }

    //Initilizing score label
    private func configureScoreLabel() {
        questionTitleLabel = UILabel(frame: CGRect.zero)
        if let _ = questionTitleLabel {
            self.addSubview(questionTitleLabel!)
            questionTitleLabel!.text = questionLabelText
            questionTitleLabel!.font = UIFont.boldSystemFont(ofSize: questionTitleLabelFontSize)
            questionTitleLabel!.textAlignment = .center
            questionTitleLabel!.translatesAutoresizingMaskIntoConstraints = false
            addAutolayoutInScoreLabel()
        }
    }
    
    //Addign autolayout in score label
    private func addAutolayoutInScoreLabel() {
        NSLayoutConstraint.activate([
            questionTitleLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: zeroConstant),
            (questionTitleLabel!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: zeroConstant)),
            (questionTitleLabel!.centerYAnchor.constraint(equalTo: self.centerYAnchor))
            ])
    }
    
    //Initilizing done button
    private func configureDoneButton() {
        doneButton = UIButton(frame: CGRect.zero)
        if let _ = doneButton {
            self.addSubview(doneButton!)
            doneButton!.setTitle(doneButtonTitle, for: .normal)
            doneButton!.setTitleColor(UIColor.blue, for: UIControl.State.normal)
            doneButton!.addTarget(self, action: #selector(onDoneButtonTapped), for: .touchUpInside)
            doneButton!.titleLabel?.font = UIFont.boldSystemFont(ofSize: playButtonFontSize)
            doneButton!.translatesAutoresizingMaskIntoConstraints = false
            addAutolayoutInDoneButton()
        }
    }
    
    //Adding autolayout in done button
    private func addAutolayoutInDoneButton() {
        NSLayoutConstraint.activate([
            (doneButton!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: zeroConstant)),
            (doneButton!.widthAnchor.constraint(equalToConstant: doneButtonWidhtConstant)),
            (doneButton!.centerYAnchor.constraint(equalTo: self.centerYAnchor))
            ])
    }
    
    //Taking action when done button tapped
    @objc func onDoneButtonTapped(sender: UIButton!) {
        delegate?.onDoneButtonTapped()
    }
}
