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
    
    public func stimulate<E: Event>(event: E) -> UIResponder? {
        var responder : UIResponder? = self
        while (responder != nil) {
            if let r = responder as? E.Responder {
                event.stimulate(r)
                return responder
            }
            responder = responder?.nextResponder()
        }
        return nil
    }
    
}