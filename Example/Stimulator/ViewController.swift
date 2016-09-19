//
//  ViewController.swift
//  Stimulator
//
//  Created by yuki.takahashi on 09/19/2016.
//  Copyright (c) 2016 yuki.takahashi. All rights reserved.
//

import UIKit

class MyView : UIView {
    
    class func instantiate() -> MyView {
        return UINib(nibName: "MyView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! MyView
    }
    
    @IBAction func clicked(_: AnyObject) {
        self.stimulate(event: ShowAlertEvent("title", "message"))
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
        let alert = UIAlertController(title: event.title, message: event.message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { _ in }))
        self.show(alert, sender: nil)
    }
    
}
