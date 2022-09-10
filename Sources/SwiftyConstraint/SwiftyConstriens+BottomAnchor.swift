//
//  SwiftyConstriens+BottomAnchor.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 07/06/2022.
//

import UIKit
// MARK: - Handel Bottom Anchor contriens

public extension SwiftyConstraint {

    /// Add bottomAnchor.constraint(equalTo)  with constant value
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    
    static func bottom (_ with:NSLayoutYAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint( .bottomAnchorConstraint(anchor: with, relation: .equalTo, option:  [.constant(padding)] ))
     }
    
    /// Add bottomAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    ///
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter option: more options to configure the constriens

    static func bottom (_ with:NSLayoutYAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .bottomAnchorConstraint(anchor: with, relation: .equalTo, option: option ))
     }

    /// Add bottomAnchor.constraint(greaterThanOrEqulTo)  with constant value
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func bottomGreaterThan (_ with:NSLayoutYAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint( .bottomAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: [.constant(padding)]) )
     }

    /// Add bottomAnchor.constraint(greaterThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    ///
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func bottomGreaterThan (_ with:NSLayoutYAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.bottomAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: option))
     }

    /// Add bottomAnchor.constraint(lessThanOrEqulTo)  with constant value
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func bottomLessThan (_ with:NSLayoutYAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.bottomAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: [.constant(padding)]))
     }

    /// Add bottomAnchor.constraint(lessThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    ///
    /// - Parameter with: an NSLayoutYAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func bottomLessThan (_ with:NSLayoutYAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.bottomAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: option))
     }

}

internal extension UIView {
    
     func setBottomConstraints(_ constrain : SwiftyConstraint) {
         guard  case .bottomAnchorConstraint(anchor: let anchor, relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
        
        var constraint: NSLayoutConstraint 
  
        switch relation {
        case .equalTo:
            constraint = bottomAnchor.constraint(equalTo: anchor, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .bottom else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
 
         
         constraint.isActive = true
        
    }
}

