//
//  ServiceKey.swift
//  
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation

/// ServiceKey structure.
struct ServiceKey {
    /// Abstraction type typealias.
    typealias Abstraction = Any
    
    /// Abstraction type value.
    let value: Abstraction.Type
}

extension ServiceKey: Equatable {
    static func == (lhs: ServiceKey, rhs: ServiceKey) -> Bool {
        lhs.value == rhs.value
    }
}

extension ServiceKey: Hashable {
    func hash(into hasher: inout Hasher) {
        ObjectIdentifier(value).hash(into: &hasher)
    }
}
