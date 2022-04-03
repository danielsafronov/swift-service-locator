//
//  MockAbstraction.swift
//  
//
//  Created by Daniel Safronov on 03.04.2022.
//

import Foundation
import ServiceLocator

/// MockAbstraction structure.
struct MockAbstraction<T>: MockAbstractionProtocol, Equatable where T: Equatable {
    let value: T
}
