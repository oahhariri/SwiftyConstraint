//
//  SwiftyConstriens+RightAnchor.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 07/06/2022.
//

import UIKit

// MARK: - Handel Right Anchor contriens

public extension SwiftyConstraint {
    
    /// Add rightAnchor.constraint(equalTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func right (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.rightAnchorConstraint(anchor: with, relation: .equalTo, option: [.constant(padding)] ))
    }
    
    /// Add rightAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func right (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.rightAnchorConstraint(anchor: with, relation: .equalTo, option: option ))
    }
    
    /// Add rightAnchor.constraint(greaterThanOrEqulTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func rightGreaterThan (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.rightAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: [.constant(padding)] ))
    }
    
    /// Add rightAnchor.constraint(greaterThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func rightGreaterThan (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.rightAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: option ))
    }
    
    
    /// Add rightAnchor.constraint(lessThanOrEqulTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func rightLessThan (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.rightAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: [.constant(padding)] ))
    }
    
    /// Add rightAnchor.constraint(lessThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func rightLessThan (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.rightAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: option ))
    }
    
}

internal extension UIView {
    
     func setRightConstraints(_ constrain : SwiftyConstraint) {
         guard  case .rightAnchorConstraint(anchor: let anchor, relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
       
        var constraint: NSLayoutConstraint
  
        switch relation {
        case .equalTo:
            constraint = rightAnchor.constraint(equalTo: anchor, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .right else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
         
 
         
         constraint.isActive = true
        
    }
}
