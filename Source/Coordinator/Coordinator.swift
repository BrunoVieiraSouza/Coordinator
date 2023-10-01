//
//  Coordinator.swift
//  Coordinator
//
//  Created by Bruno Vieira Souza on 27/09/23.
//

import Foundation

public protocol CoordinatorProtocol: AnyObject {
    var parentCoordinator: CoordinatorProtocol? { get }
    
    func handle(event: CoordinatorEvent)
    func start(_ completion: @escaping () -> Void)
}

public extension CoordinatorProtocol {
    var parentCoordinator: CoordinatorProtocol? { return nil }
}
