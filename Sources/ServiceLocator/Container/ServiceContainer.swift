//
//  ServiceContainer.swift
//  
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

/// ServiceContainer class.
final public class ServiceContainer: ServiceContainerProtocol {
    /// Container register.
    private var register: [ServiceKey: ServiceEntry] = [:]
    
    /// Registers a service in container.
    /// - parameter abstraction: A service abstraction.
    /// - parameter concrete: A service instance.
    public func register<Service>(abstraction: Service.Type, concrete: Service) {
        let instanceKey = ServiceKey(value: abstraction)
        let instance = ServiceEntry(type: abstraction, value: concrete)
        
        register[instanceKey] = instance
    }
    
    /// Resolve an abstraction from container.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved instance.
    public func resolve<Service>(abstraction: Service.Type) -> Service? {
        let instanceKey = ServiceKey(value: abstraction)
        return register[instanceKey]?.value as? Service
    }
}
