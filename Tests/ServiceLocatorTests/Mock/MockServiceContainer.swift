//
//  MockServiceContainer.swift
//  ServiceLocatorTests
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation
import ServiceLocator
import ServiceContainer

/// MockServiceContainer class.
class MockServiceContainer: ServiceContainer {
    /// Registers a service in container.
    /// - parameter abstraction: A service abstraction.
    /// - parameter concrete: A service instance.
    public func register<Service>(abstraction: Service.Type, concrete: Service) {
        return
    }
    
    /// Resolve an abstraction from container.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved service.
    public func resolve<Service>(abstraction: Service.Type) -> Service? {
        return nil
    }
}
