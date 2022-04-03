//
//  ServiceLocatorProtocol+Extensions.swift
//  
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

extension ServiceLocatorProtocol {
    /// Resolve an abstraction from container.
    /// - returns: A resolved abstraction instance or `nil`.
    public func resolve<Service>() -> Service? {
        resolve(abstraction: Service.self)
    }
    
    /// Resolve an abstraction from container.
    /// Unconditionally stops execution if resolved abstraction is `nil`.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved abstraction instance.
    public func requireResolve<Service>(abstraction: Service.Type) -> Service {
        guard let instance = resolve(abstraction: Service.self) else {
            fatalError("Unable to resolve abstraction")
        }
        
        return instance
    }
    
    /// Resolve an abstraction from container.
    /// Unconditionally stops execution if resolved abstraction is `nil`.
    /// - returns: A resolved abstraction instance.
    public func requireResolve<Service>() -> Service {
        requireResolve(abstraction: Service.self)
    }
}
