//
//  ViewController.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    var scoreLabel: UILabel?
    var scorePointLabel: UILabel?
    var playButton: UIButton?
    
    // MARK: ViewController life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
}

extension LandingViewController {
    // MARK: ViewController local methods

    //calling all method which requires to initlize UI
    private func configureUI() {
        configureScoreLabel()
        configureScorePointLabel()
        configurePlayButton()
        addNotificatioObserver()
    }
    
    //Adding Notification observer to get updated score.
    private func addNotificatioObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(onUpdateScoreNotificationRecieved), name: NSNotification.Name(rawValue: ScoreUpdateNotification), object: nil)
    }
    
    //Updating score in UI
    @objc func onUpdateScoreNotificationRecieved(notification: Notification) {
        if let viewModel = notification.object as? QuestionViewModel {
            scorePointLabel?.text = String(viewModel.score)
        }
    }
    
    //Creating score label
    private func configureScoreLabel() {
        scoreLabel = UILabel(frame: CGRect.zero)
        if let _ = scoreLabel {
            self.view.addSubview(scoreLabel!)
            scoreLabel?.text = scoreLabelText
            scoreLabel?.font = UIFont.boldSystemFont(ofSize: scoreLabelFontSize)
            scoreLabel?.textAlignment = .center
            addAutolayoutConstraints(control: scoreLabel!,constantTuple: (scoreLabelLeadingConstraint, scoreLabelTrailingConstraint , scoreLabelTopConstraint))
        }
    }
    
    //Creating score point label
    private func configureScorePointLabel() {
        scorePointLabel = UILabel(frame: CGRect.zero)
        if let _ = scorePointLabel {
            self.view.addSubview(scorePointLabel!)
            scorePointLabel?.text = zeroScoreValue
            scorePointLabel?.font = UIFont.boldSystemFont(ofSize: scorePointLabelFontSize)
            scorePointLabel?.textAlignment = .center
            addAutolayoutConstraints(control: scorePointLabel!,constantTuple: (scorePointLabelLeadingConstraint, scorePointLabelTrailingConstraint , scorePointLabelTopConstraint))
        }
    }
    
    //Creating play button
    private func configurePlayButton() {
        playButton = UIButton(frame: CGRect.zero)
        if let _ = playButton {
            self.view.addSubview(playButton!)
            playButton!.setTitle(playButtonTitle, for: .normal)
            playButton!.setTitleColor(UIColor.blue, for: UIControl.State.normal)
            playButton!.addTarget(self, action: #selector(onPlayButtonTapped), for: .touchUpInside)
            playButton!.titleLabel?.font = UIFont.boldSystemFont(ofSize: playButtonFontSize)
            addAutolayoutConstraints(control: playButton!,constantTuple: (playButtonLeadingConstraint, playButtonTrailingConstraint , playButtonTopConstraint))
        }
    }
    
    //Taking action when play button tapped
    @objc func onPlayButtonTapped(sender: UIButton!) {
        showQuestionsScreen()
    }
    
    //Presenting question screen
    private func showQuestionsScreen() {
        let questionsViewController = QuestionsViewController.instantiate(fromAppStoryboard: .main)
        self.present(questionsViewController, animated: true, completion: nil)
    }
}
