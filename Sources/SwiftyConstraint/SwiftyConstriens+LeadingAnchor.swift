//
//  SwiftyConstriens+LeadingAnchor.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 07/06/2022.
//

import UIKit

 
// MARK: - Handel leading Anchor contriens
 
public extension SwiftyConstraint {
    /// Add leadingAnchor.constraint(equalTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func leading (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.leadingAnchorConstraint(anchor: with, relation: .equalTo, option: [.constant(padding)] ))
     }

    /// Add leadingAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func leading (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.leadingAnchorConstraint(anchor: with, relation: .equalTo, option: option))
     }

    /// Add leading.constraint(greaterThanOrEqualTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func leadingGreaterThan (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.leadingAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: [.constant(padding)] ))
     }

    /// Add leadingAnchor.constraint(greaterThanOrEqualTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func leadingGreaterThan (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.leadingAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: option ))
    
     }


    /// Add leading.constraint(lessThanOrEqualTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func leadingLessThan (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.leadingAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: [.constant(padding)] ))
     }

    /// Add leadingAnchor.constraint(lessThanOrEqualTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func leadingLessThan (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.leadingAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: option))
     }

}


internal extension UIView {
    
    
     func setLeadingConstraints(_ constrain : SwiftyConstraint) {
         guard  case .leadingAnchorConstraint(anchor: let anchor, relation: let relation, option: let info) = constrain.constraint else {
            fatalError("SwiftyConstraint Error - Constraint type dose not match")
        }
        
        var constraint: NSLayoutConstraint 
   
        switch relation {
        case .equalTo:
            constraint = leadingAnchor.constraint(equalTo: anchor, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
          
         guard constraint.firstAttribute == .leading else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
        
         constraint.isActive = true
        
    }
    
}
