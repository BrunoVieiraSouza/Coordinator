//
//  CoordinatorEvent.swift
//  Coordinator
//
//  Created by Bruno Vieira Souza on 27/09/23.
//

import Foundation

public final class CoordinatorEventType: Hashable {
    private let wrapped: CoordinatorEvent.Type
    
    public init(_ type: CoordinatorEvent.Type) {
        self.wrapped = type
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(wrapped).hashValue)
    }
    
    public static func == (lhs: CoordinatorEventType, rhs: CoordinatorEventType) -> Bool {
        return lhs.wrapped == rhs.wrapped
    }
    
}

public protocol CoordinatorEvent {}

public extension CoordinatorEvent {
    var key: CoordinatorEventType { return CoordinatorEventType(type(of: self)) }
    static var key: CoordinatorEventType { return CoordinatorEventType(self) }
}
