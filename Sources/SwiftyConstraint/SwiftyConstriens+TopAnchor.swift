//
//  SwiftyConstriens+TopAnchor.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 07/06/2022.
//

import UIKit

// MARK: - Handel top Anchor contriens
public extension SwiftyConstraint {
    /// Add topAnchor.constraint(equalTo)  with constant value
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func top (_ with:NSLayoutYAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint( .topAnchorConstraint(anchor: with, relation: .equalTo, option: [.constant(padding)] ) )
    }
 
    
    /// Add topAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter option: more options to configure the constriens

    static func top (_ with:NSLayoutYAxisAnchor,_ option: [ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.topAnchorConstraint(anchor: with, relation: .equalTo, option: option ))
    }
    
    /// Add topAnchor.constraint(greaterThanOrEqualTo) with constant value
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func topGreaterThan (_ with:NSLayoutYAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.topAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: [.constant(padding)] ))
    }
    
    /// Add topAnchor.constraint(greaterThanOrEqualTo) with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func topGreaterThan (_ with:NSLayoutYAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.topAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: option ))
    }
    
    /// Add topAnchor.constraint(lessThanOrEqualTo) with constant value
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func topLessThan (_ with:NSLayoutYAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.topAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo,option: [.constant(padding)] ))
    }
    
    /// Add topAnchor.constraint(lessThanOrEqualTo) with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func topLessThan (_ with:NSLayoutYAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.topAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: option))
    }
}

 
 
internal extension UIView {
    
    func setTopConstraints(_ constrain : SwiftyConstraint) {
        guard  case .topAnchorConstraint(anchor: let anchor, relation: let relation, option: let info) = constrain.constraint else {
            fatalError("SwiftyConstraint Error - Constraint type dose not match") }
        
        var constraint: NSLayoutConstraint
        
        switch relation {
        case .equalTo:
            constraint = topAnchor.constraint(equalTo: anchor, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
        
        guard constraint.firstAttribute == .top else{
            fatalError("SwiftyConstraint Error - Constraint type dose not match")
        }
        
        constraint.isActive = true
        
    }
    
}

