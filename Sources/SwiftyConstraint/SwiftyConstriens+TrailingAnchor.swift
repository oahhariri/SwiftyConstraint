//
//  SwiftyConstriens+TrailingAnchor.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 07/06/2022.
//

import UIKit

// MARK: - Handel Trailing Anchor contriens

public extension SwiftyConstraint {

    /// Add trailingAnchor.constraint(equalTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func trailing (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.trailingAnchorConstraint(anchor: with, relation: .equalTo, option: [.constant(padding)]))
     }

    /// Add trailingAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func trailing (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.trailingAnchorConstraint(anchor: with, relation: .equalTo, option: option))
     }

    /// Add trailingAnchor.constraint(greaterThanOrEqulTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func trailingGreaterThan (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint( .trailingAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: [.constant(padding)]))
     }

    /// Add trailingAnchor.constraint(greaterThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func trailingGreaterThan (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.trailingAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: option))
     }


    /// Add trailingAnchor.constraint(lessThanOrEqulTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func trailingLessThan (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint( .trailingAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: [.constant(padding)]))
     }
      
    /// Add trailingAnchor.constraint(lessThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func trailingLessThan (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .trailingAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: option))
     }

}


internal extension UIView {
    
     func setTrailingConstraints(_ constrain : SwiftyConstraint) {
         guard  case .trailingAnchorConstraint(anchor: let anchor, relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
        
        var constraint: NSLayoutConstraint
  
        switch relation {
        case .equalTo:
            constraint = trailingAnchor.constraint(equalTo: anchor, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .trailing else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
         
 
         
         constraint.isActive = true
        
    }
}
