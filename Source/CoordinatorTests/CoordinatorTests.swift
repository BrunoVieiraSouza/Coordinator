//
//  CoordinatorTests.swift
//  CoordinatorTests
//
//  Created by Bruno Vieira Souza on 27/09/23.
//

import XCTest
@testable import Coordinator

enum Event: CoordinatorEvent {
    case event
}

final class Coordinator: BaseCoordinator {
    
    var events: [Event] = []
    
    override init() {
        super.init()
        self.register(eventType: Event.self) {[unowned self] in self.events.append($0) }
    }
}

final class CoordinatorTests: XCTestCase {
    
    func testHandlerOfCoordinator() {
        let coordinator = Coordinator()
        
        XCTAssertEqual(coordinator.events.count, 0)
        coordinator.handle(event: Event.event)
        XCTAssertEqual(coordinator.events.count, 1)
    }
}
