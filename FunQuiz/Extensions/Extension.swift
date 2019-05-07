//
//  Extension.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //This method initlize the header view for question screen
    func configureTopHeaderView()->QuestionsHeaderView {
        let headerView: QuestionsHeaderView = UIView.fromNib()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.delegate = self as? QuestionsHeaderViewDelegate
        self.view.addSubview(headerView)
            NSLayoutConstraint.activate([
                headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: zeroConstant),
                headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: zeroConstant),
                headerView.heightAnchor.constraint(equalToConstant: headerViewHeight),
                headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: headerViewTopConstraint)
                ])
        return headerView
    }
    
    //This method initilize the footer view for question screen
    func configureFooterView()->QuestionsFooterView {
        let footerView: QuestionsFooterView = UIView.fromNib()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.delegate = self as? QuestionsFooterViewDelegate
        self.view.addSubview(footerView)
        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: zeroConstant),
            footerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: zeroConstant),
            footerView.heightAnchor.constraint(equalToConstant: footerViewHeight),
            footerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: footerViewBottomConstraint)
            ])
        return footerView
    }
    
    //Adding autolayout in generic controls
    func addAutolayoutConstraints(control:UIView, constantTuple: (CGFloat, CGFloat, CGFloat)) {
        control.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (control.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: constantTuple.0)),
            (control.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: constantTuple.1)),
            (control.topAnchor.constraint(equalTo: self.view.topAnchor, constant: constantTuple.2))
            ])
    }
}

extension UIView {
    //Adding autolayout in generic controls
    func addAutolayoutConstraints(control:UIView, constantTuple: (CGFloat, CGFloat, CGFloat)) {
        control.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            (control.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constantTuple.0)),
            (control.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constantTuple.1)),
            (control.topAnchor.constraint(equalTo: self.topAnchor, constant: constantTuple.2))
            ])
    }
}
