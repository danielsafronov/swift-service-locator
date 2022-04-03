//
//  ServiceLocator.swift
//  
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

/// ServiceLocator structure.
public struct ServiceLocator: ServiceLocatorProtocol {
    /// ServiceContainerProtocol instance.
    let container: ServiceContainerProtocol
    
    /// Create a new ServiceLocator instance.
    public init() {
        self.init(container: ServiceContainer())
    }
    
    /// Create a new ServiceLocator instance.
    /// - parameter container: An instance of ServiceContainerProtocol.
    public init(container: ServiceContainerProtocol) {
        self.container = container
    }
    
    /// Registers a service in container.
    /// - parameter abstraction: A service abstraction.
    /// - parameter concrete: A service instance.
    public func register<Service>(abstraction: Service.Type, concrete: Service) {
        container.register(abstraction: abstraction, concrete: concrete)
    }
    
    /// Resolve an abstraction from container.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved instance.
    public func resolve<Service>(abstraction: Service.Type) -> Service? {
        container.resolve(abstraction: abstraction)
    }
}
