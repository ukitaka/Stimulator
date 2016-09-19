//
//  Stimulator.swift
//  Pods
//
//  Created by Yuki Takahashi on 2016/09/19.
//
//

import Foundation

public protocol Event {
    associatedtype Responder
    func stimulate(responder: Responder)
}

public extension UIResponder  {
    
    @discardableResult
    public func stimulate<E: Event>(event: E) -> E.Responder? {
        if let responder = stimulateResponder(event: event) {
            event.stimulate(responder: responder)
            return responder
        }
        return nil
    }
    
    @discardableResult
    public func stimulateResponder<E: Event>(event: E) -> E.Responder? {
        var responder : UIResponder? = self
        while (responder != nil) {
            if let responder = responder as? E.Responder {
                return responder
            }
            responder = responder?.next
        }
        return nil
    }
    
}
