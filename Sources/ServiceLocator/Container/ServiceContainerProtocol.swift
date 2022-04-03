//
//  ServiceContainerProtocol.swift
//  
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

/// ServiceContainerProtocol protocol.
public protocol ServiceContainerProtocol {
    /// Registers a service in container.
    /// - parameter abstraction: A service abstraction.
    /// - parameter concrete: A service instance.
    func register<Service>(abstraction: Service.Type, concrete: Service)
    
    /// Resolve an abstraction from container.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved instance.
    func resolve<Service>(abstraction: Service.Type) -> Service?
}
