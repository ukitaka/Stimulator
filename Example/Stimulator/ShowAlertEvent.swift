//
//  ShowAlertEvent.swift
//  Stimulator
//
//  Created by Yuki Takahashi on 2016/09/19.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import Foundation
import Stimulator

struct ShowAlertEvent : Stimulator.Event {
    typealias Responder = ShowAlertResponder
    
    let title: String
    let message: String
    
    init(_ title: String, _ message: String) {
        self.title = title
        self.message = message
    }
    
    func stimulate(responder: Responder) {
        responder.showAlert(event: self)
    }
}

protocol ShowAlertResponder {
    func showAlert(event: ShowAlertEvent)
}
