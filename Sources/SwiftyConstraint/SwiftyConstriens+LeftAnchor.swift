//
//  SwiftyConstriens+LeftAnchor.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 07/06/2022.
//

import UIKit
  
 // MARK: - Handel Left Anchor contriens
 
public extension SwiftyConstraint {
    
    /// Add leftAnchor.constraint(equalTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func left (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.leftAnchorConstraint(anchor: with, relation: .equalTo, option: [.constant(padding)]))
    }
    
    /// Add leftAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func left (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.leftAnchorConstraint(anchor: with, relation: .equalTo, option: option ))
    }
    
    /// Add leftAnchor.constraint(greaterThanOrEqulTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func leftGreaterThan (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.leftAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: [.constant(padding)]))
    }
    
    /// Add leftAnchor.constraint(greaterThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func leftGreaterThan (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .leftAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: option))
    }
    
    
    /// Add leftAnchor.constraint(lessThanOrEqulTo)  with constant value
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter padding:
    /// add padding to the constraint
    static func leftLessThan (_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.leftAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: [.constant(padding)]))
    }
    
    /// Add leftAnchor.constraint(lessThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: an NSLayoutXAxisAnchor
    /// - Parameter option: more options to configure the constriens
    static func leftLessThan (_ with:NSLayoutXAxisAnchor,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.leftAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: option))
    }
    
}

internal extension UIView {
    
     func setLeftConstraints(_ constrain : SwiftyConstraint) {
         guard  case .leftAnchorConstraint(anchor: let anchor, relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
        
        var constraint: NSLayoutConstraint
         
        switch relation {
        case .equalTo:
            constraint = leftAnchor.constraint(equalTo: anchor, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .left else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
         
     
         
         constraint.isActive = true
        
    }
}
