//
//  ServiceContainer.swift
//  ServiceLocator
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

/// ServiceContainer protocol.
public protocol ServiceContainer {
    /// Registers a service in a `ServiceContainer`.
    /// - parameter abstraction: A service abstraction.
    /// - parameter concrete: A service instance.
    func register<Service>(abstraction: Service.Type, concrete: Service)
    
    /// Resolves an abstraction from `ServiceContainer`.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved instance or `nil`.
    func resolve<Service>(abstraction: Service.Type) -> Service?
}
