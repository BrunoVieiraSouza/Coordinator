//
//  BaseCoordinator.swift
//  Coordinator
//
//  Created by Bruno Vieira Souza on 27/09/23.
//

import Foundation

open class BaseCoordinator: CoordinatorProtocol {
    
    public let parentCoordinator: CoordinatorProtocol?
    
    private var registeredEvents: [CoordinatorEventType: (CoordinatorEvent) -> Void]
 
    public init() {
        self.registeredEvents = [:]
        self.parentCoordinator = nil
    }
    
    public init(parentCoordinator: CoordinatorProtocol?) {
        self.registeredEvents = [:]
        self.parentCoordinator = parentCoordinator
    }
    
    public func register<Event: CoordinatorEvent>(eventType: Event.Type, handler: @escaping (Event) -> Void) {
        self.registeredEvents[eventType.key] = { event in
            if let event = event as? Event {
                handler(event)
            }
        }
    }
    
    open func handle(event: CoordinatorEvent) {
        let key = event.key
        
        guard let handler = self.registeredEvents[key] else {
            self.parentCoordinator?.handle(event: event)
            return
        }
        handler(event)
    }
    
    open func start(_ completion: @escaping () -> Void) {
        completion()
    }
}
