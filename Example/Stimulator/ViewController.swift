//
//  ViewController.swift
//  Stimulator
//
//  Created by yuki.takahashi on 07/29/2015.
//  Copyright (c) 2015 yuki.takahashi. All rights reserved.
//

import UIKit

class MyView : UIView {
    
    class func instantiate() -> MyView {
        return UINib(nibName: "MyView", bundle: nil).instantiateWithOwner(nil, options: nil).first as! MyView
    }
    
    @IBAction func clicked(_: AnyObject) {
        self.stimulate(ShowAlertEvent("title", "message"))
    }
    
}

class MyViewController: UIViewController, ShowAlertResponder {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = MyView.instantiate()
        myView.center = self.view.center
        self.view.addSubview(myView)
    }
    
    func showAlert(event: ShowAlertEvent) {
        let alert = UIAlertController(title: event.title, message: event.message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { _ in }))
        self.showViewController(alert, sender: nil)
    }
    
}