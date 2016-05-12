//
//  Stimulator.swift
//  Pods
//
//  Created by Yuki Takahashi on 2015/07/29.
//
//

import Foundation

public protocol Event {
    associatedtype Responder
    func stimulate(responder: Responder)
}

public extension UIResponder  {
    
    public func stimulate<E: Event>(event: E) -> E.Responder? {
        if let responder = stimulateResponder(event) {
            event.stimulate(responder)
            return responder
        }
        return nil
    }
    
    public func stimulateResponder<E: Event>(event: E) -> E.Responder? {
        var responder : UIResponder? = self
        while (responder != nil) {
            if let responder = responder as? E.Responder {
                return responder
            }
            responder = responder?.nextResponder()
        }
        return nil
    }
    
}