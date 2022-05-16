//
//  ServiceEntry.swift
//  ServiceLocator
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

/// ServiceEntry structure.
struct ServiceEntry {
    /// Abstraction type typealias.
    typealias Abstraction = Any
    
    /// Abstraction type value.
    let type: Abstraction.Type
    
    /// Abstraction instance.
    let value: Abstraction
}
