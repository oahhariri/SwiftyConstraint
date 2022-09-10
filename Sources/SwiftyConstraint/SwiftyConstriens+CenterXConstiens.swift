//
//  SwiftyConstriens+CenterXConstiens.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 08/06/2022.
//

import UIKit

// MARK: - Handel Center-X Anchor contriens
public extension SwiftyConstraint {

    /// Add centerXAnchor.constraint(equalTo)  with constant value
    /// - Parameter inView: UIView
    /// - Parameter padding:
    /// add padding to the constraint
    static func centerX (_ inView:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.centerXAnchorConstraint(inView: inView, relation: .equalTo, option: [.constant(padding)] ))
     }

    /// Add centerXAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: UIView
    /// - Parameter option: more options to configure the constriens
    
    static func centerX (_ inView:UIView,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.centerXAnchorConstraint(inView: inView, relation: .equalTo, option: option ))
     }

    /// Add centerXAnchor.constraint(greaterThanOrEqulTo)  with constant value
    /// - Parameter with: UIView
    /// - Parameter padding:
    /// add padding to the constraint
    static func centerXGreaterThan (_ inView:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint( .centerXAnchorConstraint(inView: inView, relation: .greaterThanOrEqulTo, option: [.constant(padding)] ))
     }

    /// Add centerXAnchor.constraint(greaterThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: UIView
    /// - Parameter option: more options to configure the constriens
    
    static func centerXGreaterThan (_ inView:UIView,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.centerXAnchorConstraint(inView: inView, relation: .greaterThanOrEqulTo, option: option))
     }
    /// Add centerXAnchor.constraint(lessThanOrEqulTo)  with constant value
    /// - Parameter with: UIView
    /// - Parameter padding:
    /// add padding to the constraint
    static func centerXLessThan (_ inView:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.centerXAnchorConstraint(inView: inView, relation: .lessThanOrEqulTo, option: [.constant(padding)] ))
     }

    /// Add centerXAnchor.constraint(lessThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: UIView
    /// - Parameter option: more options to configure the constriens
    
    static func centerXLessThan (_ inView:UIView,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.centerXAnchorConstraint(inView: inView, relation: .lessThanOrEqulTo, option: option))
     }

    
}

internal extension UIView {
    
     func setCenterXConstraints(_ constrain : SwiftyConstraint) {
         guard  case .centerXAnchorConstraint(inView: let inView, relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }

         var constraint: NSLayoutConstraint  

        switch relation {
        case .equalTo:
            constraint = centerXAnchor.constraint(equalTo: inView.centerXAnchor, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = centerXAnchor.constraint(greaterThanOrEqualTo: inView.centerXAnchor, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = centerXAnchor.constraint(lessThanOrEqualTo: inView.centerXAnchor, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .centerX else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
          
         
         constraint.isActive = true
        
    }
}
