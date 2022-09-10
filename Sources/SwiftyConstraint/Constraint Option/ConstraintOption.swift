//
//  ConstraintOption.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 10/09/2022.
//

import UIKit

/// Constraint configration
public enum ConstraintOption: Hashable {
    /// Add padding to the constraint
    case constant (_: CGFloat)
    /// set priority of the constraint
    case priority (_: Float)
}


internal extension Array where Element == ConstraintOption {
    var constant: CGFloat {
        for option in self {
            guard case .constant(let padding) = option else {continue}
            return padding
        }
        return 0
    }
    
    var priority: Float? {
        for option in self {
            guard case .priority(let priority) = option else {continue}
            return priority
        }
        return nil
    }
}
