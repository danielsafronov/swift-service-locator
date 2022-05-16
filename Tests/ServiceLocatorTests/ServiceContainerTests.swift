//
//  ServiceContainerTests.swift
//  
//
//  Created by Daniel Safronov on 03.04.2022.
//

import XCTest
@testable import ServiceLocator

class ServiceContainerTests: XCTestCase {
    func testCreate() {
        XCTAssertNoThrow(DefaultServiceContainer())
    }
    
    func testRegisterNoThrow() {
        let serviceContainer = DefaultServiceContainer()
        XCTAssertNoThrow(
            serviceContainer.register(
                abstraction: MockAbstractionProtocol.self,
                concrete: MockAbstraction(value: "Mock Abstraction")
            )
        )
    }
    
    func testResolveNoThrow() {
        let serviceContainer = DefaultServiceContainer()
        XCTAssertNoThrow(serviceContainer.resolve(abstraction: MockAbstractionProtocol.self))
    }
    
    func testResolveNil() {
        let serviceContainer = DefaultServiceContainer()
        XCTAssertNil(serviceContainer.resolve(abstraction: MockAbstractionProtocol.self))
    }
    
    func testResolveСoncrete() {
        let mockAbstraction = MockAbstraction(value: "Mock Abstraction")
        let serviceContainer = DefaultServiceContainer()
        serviceContainer.register(abstraction: MockAbstractionProtocol.self, concrete: mockAbstraction)
        
        let resolvedAbstraction = serviceContainer.resolve(abstraction: MockAbstractionProtocol.self)
        XCTAssertNotNil(resolvedAbstraction)
        XCTAssertTrue(resolvedAbstraction is MockAbstraction<String>)
        XCTAssertEqual(mockAbstraction, resolvedAbstraction as? MockAbstraction<String>)
    }
    
    func testResolveСoncreteShort() {
        let mockAbstraction = MockAbstraction(value: "Mock Abstraction")
        let serviceContainer = DefaultServiceContainer()
        serviceContainer.register(abstraction: MockAbstractionProtocol.self, concrete: mockAbstraction)
        
        let resolvedAbstraction: MockAbstractionProtocol = serviceContainer.resolve()!
        XCTAssertNotNil(resolvedAbstraction)
        XCTAssertTrue(resolvedAbstraction is MockAbstraction<String>)
        XCTAssertEqual(mockAbstraction, resolvedAbstraction as? MockAbstraction<String>)
    }
    
    func testRequireResolveСoncrete() {
        let mockAbstraction = MockAbstraction(value: "Mock Abstraction")
        let serviceContainer = DefaultServiceContainer()
        serviceContainer.register(abstraction: MockAbstractionProtocol.self, concrete: mockAbstraction)
        
        let resolvedAbstraction = serviceContainer.requireResolve(abstraction: MockAbstractionProtocol.self)
        XCTAssertTrue(resolvedAbstraction is MockAbstraction<String>)
        XCTAssertEqual(mockAbstraction, resolvedAbstraction as? MockAbstraction<String>)
    }
}
