//
//  ServiceLocator+Extensions.swift
//  ServiceLocator
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

extension ServiceLocator {
    /// Resolves an abstraction from `ServiceLocator`.
    /// - returns: A resolved instance or `nil`.
    public func resolve<Service>() -> Service? {
        resolve(abstraction: Service.self)
    }
    
    /// Resolves an abstraction from `ServiceLocator`.
    /// Unconditionally stops execution if resolved abstraction is `nil`.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved instance.
    public func requireResolve<Service>(abstraction: Service.Type) -> Service {
        guard let instance = resolve(abstraction: Service.self) else {
            fatalError("Unable to resolve abstraction")
        }
        
        return instance
    }
    
    /// Resolves an abstraction from `ServiceLocator`.
    /// Unconditionally stops execution if resolved abstraction is `nil`.
    /// - returns: A resolved instance .
    public func requireResolve<Service>() -> Service {
        requireResolve(abstraction: Service.self)
    }
}
