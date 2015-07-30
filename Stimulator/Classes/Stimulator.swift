//
//  Stimulator.swift
//  Pods
//
//  Created by Yuki Takahashi on 2015/07/29.
//
//

import Foundation

public protocol Event {
    typealias Responder
    func stimulate(responder: Responder)
}

public extension UIResponder  {
    
    public func stimulate<E: Event>(event: E) -> E.Responder? {
        var responder : UIResponder? = self
        while (responder != nil) {
            if let responder = responder as? E.Responder {
                event.stimulate(responder)
                return responder
            }
            responder = responder?.nextResponder()
        }
        return nil
    }
    
}