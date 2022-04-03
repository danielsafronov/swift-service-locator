//
//  ServiceLocatorTests.swift
//  
//
//  Created by Daniel Safronov on 03.04.2022.
//

import XCTest
@testable import ServiceLocator

class ServiceLocatorTests: XCTestCase {
    func testCreate() {
        XCTAssertNoThrow(ServiceLocator())
    }
    
    func testCreateDefault() {
        let serviceLocator = ServiceLocator()
        XCTAssertTrue(serviceLocator.container is ServiceContainer)
    }
    
    func testCreateCustom() {
        let serviceLocator = ServiceLocator(container: MockServiceContainer())
        XCTAssertTrue(serviceLocator.container is MockServiceContainer)
    }
    
    func testRegisterNoThrow() {
        let serviceLocator = ServiceLocator()
        XCTAssertNoThrow(serviceLocator.register(abstraction: MockAbstractionProtocol.self, concrete: MockAbstraction(value: "Mock Abstraction")))
    }
    
    func testResolveNoThrow() {
        let serviceLocator = ServiceLocator()
        XCTAssertNoThrow(serviceLocator.resolve(abstraction: MockAbstractionProtocol.self))
    }
    
    func testResolveNil() {
        let serviceLocator = ServiceLocator()
        XCTAssertNil(serviceLocator.resolve(abstraction: MockAbstractionProtocol.self))
    }
    
    func testResolveСoncrete() {
        let mockAbstraction = MockAbstraction(value: "Mock Abstraction")
        let serviceLocator = ServiceLocator()
        serviceLocator.register(abstraction: MockAbstractionProtocol.self, concrete: mockAbstraction)
        
        let resolvedAbstraction = serviceLocator.resolve(abstraction: MockAbstractionProtocol.self)
        XCTAssertNotNil(resolvedAbstraction)
        XCTAssertTrue(resolvedAbstraction is MockAbstraction<String>)
        XCTAssertEqual(mockAbstraction, resolvedAbstraction as? MockAbstraction<String>)
    }
    
    func testResolveСoncreteShort() {
        let mockAbstraction = MockAbstraction(value: "Mock Abstraction")
        let serviceLocator = ServiceLocator()
        serviceLocator.register(abstraction: MockAbstractionProtocol.self, concrete: mockAbstraction)
        
        let resolvedAbstraction: MockAbstractionProtocol = serviceLocator.resolve()!
        XCTAssertNotNil(resolvedAbstraction)
        XCTAssertTrue(resolvedAbstraction is MockAbstraction<String>)
        XCTAssertEqual(mockAbstraction, resolvedAbstraction as? MockAbstraction<String>)
    }
    
    func testRequireResolveСoncrete() {
        let mockAbstraction = MockAbstraction(value: "Mock Abstraction")
        let serviceLocator = ServiceLocator()
        serviceLocator.register(abstraction: MockAbstractionProtocol.self, concrete: mockAbstraction)
        
        let resolvedAbstraction = serviceLocator.requireResolve(abstraction: MockAbstractionProtocol.self)
        XCTAssertTrue(resolvedAbstraction is MockAbstraction<String>)
        XCTAssertEqual(mockAbstraction, resolvedAbstraction as? MockAbstraction<String>)
    }
}
