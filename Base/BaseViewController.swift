//
//  BaseViewController.swift
//  BaseProjectSwift
//
//  Created by Minh Tien on 4/9/16.
//  Copyright © 2016 MTLAB. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    var nibName_: String?
    
    class func initUsingStoryboard(storyboardName storyName: String, withIndetifier indentifier:String ) -> UIViewController{
        let storyboard = UIStoryboard(name: storyName, bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(indentifier)
    }
    
    class func initUsingStoryboard(storyboardName storyboardname: String) -> UIViewController{
        let  storyboard = UIStoryboard(name: storyboardname, bundle: nil)
        let indentyfier = String(self)
        return storyboard.instantiateViewControllerWithIdentifier(indentyfier)
    }

    
    class func newViewController() -> UIViewController{
        let  storyboard = UIStoryboard(name: "Main", bundle: nil)
        let indentyfier = String(self)
        return storyboard.instantiateViewControllerWithIdentifier(indentyfier)
    }
    
    class func nibName() -> String{
        return String(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    // MARK: Navigation Bar
    func initNavigationBar() {
    }
    
}

