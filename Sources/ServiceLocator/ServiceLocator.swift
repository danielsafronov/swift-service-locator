//
//  ServiceLocator.swift
//  ServiceLocator
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

/// ServiceLocator protocol.
public protocol ServiceLocator {
    /// Registers a service in a `ServiceLocator`.
    /// - parameter abstraction: A service abstraction.
    /// - parameter concrete: A service instance.
    func register<Service>(abstraction: Service.Type, concrete: Service)
    
    /// Resolves an abstraction from `ServiceLocator`.
    /// - parameter abstraction: A service abstraction.
    /// - returns: A resolved instance or `nil`.
    func resolve<Service>(abstraction: Service.Type) -> Service?
}
