//
//  DefaultServiceLocator.swift
//  ServiceLocator
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

/// DefaultServiceLocator structure.
public struct DefaultServiceLocator: ServiceLocator {
    /// An instance of `ServiceContainer`.
    let container: ServiceContainer
    
    /// Creates a new `DefaultServiceLocator` instance.
    /// - returns: A new instance of `DefaultServiceLocator`.
    public init() {
        self.init(container: DefaultServiceContainer())
    }
    
    /// Creates a new `DefaultServiceLocator` instance.
    /// - parameter container: An instance of `ServiceContainer`.
    /// - returns: A new instance of `DefaultServiceLocator`.
    public init(container: ServiceContainer) {
        self.container = container
    }
    
    /// Registers a service in a `ServiceLocator`.
    /// - parameter abstraction: A service abstraction.
    /// - parameter concrete: A service instance.
    public func register<Service>(abstraction: Service.Type, concrete: Service) {
        container.register(abstraction: abstraction, concrete: concrete)
    }
    
    /// Resolves an abstraction from `ServiceLocator`.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved instance or `nil`.
    public func resolve<Service>(abstraction: Service.Type) -> Service? {
        container.resolve(abstraction: abstraction)
    }
}
