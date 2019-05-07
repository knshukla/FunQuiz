//
//  AppStoryboard.swift
//  FunQuiz
//
//  Created by Kailash Narayan on 06/05/19.
//  Copyright © 2019 Kailash Narayan. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard : String{
    //Storyboards
    case main = "Main"
    fileprivate var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
   
    fileprivate func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
}

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard : AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: T.self, options: nil)![0] as! T
    }
}




