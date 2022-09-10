//
//  SwiftyConstriens+CenterYConstiens.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 08/06/2022.
//
import UIKit

// MARK: - Handel Center-X Anchor contriens
public extension SwiftyConstraint {

    /// Add centerYAnchor.constraint(equalTo)  with constant value
    /// - Parameter inView: UIView
    /// - Parameter padding:
    /// add padding to the constraint
    static func centerY (_ inView:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.centerYAnchorConstraint(inView: inView, relation: .equalTo, option: [.constant(padding)] ))
     }

    /// Add centerYAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: UIView
    /// - Parameter option: more options to configure the constriens
    
    static func centerY (_ inView:UIView,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.centerYAnchorConstraint(inView: inView, relation: .equalTo, option: option ))
     }

    /// Add centerYAnchor.constraint(greaterThanOrEqulTo)  with constant value
    /// - Parameter inView: UIView
    /// - Parameter padding:
    /// add padding to the constraint
    static func centerYGreaterThan (_ inView:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.centerYAnchorConstraint(inView: inView, relation: .greaterThanOrEqulTo, option: [.constant(padding)] ))
     }

    /// Add centerYAnchor.constraint(greaterThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: UIView
    /// - Parameter option: more options to configure the constriens
    
    static func centerYGreaterThan (_ inView:UIView,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.centerYAnchorConstraint(inView: inView, relation: .greaterThanOrEqulTo, option: option ))
     }
    /// Add centerYAnchor.constraint(lessThanOrEqulTo)  with constant value
    /// - Parameter inView: UIView
    /// - Parameter padding:
    /// add padding to the constraint
    static func centerYLessThan (_ inView:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint( .centerYAnchorConstraint(inView: inView, relation: .lessThanOrEqulTo, option: [.constant(padding)] ))
     }

    /// Add centerYAnchor.constraint(lessThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - priority (_: Float)
    ///
    /// - Parameter with: UIView
    /// - Parameter option: more options to configure the constriens
    
    
    static func centerYLessThan (_ inView:UIView,_ option:[ConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.centerYAnchorConstraint(inView: inView, relation: .lessThanOrEqulTo, option: option))
     }

    
}

internal extension UIView {
    
     func setCenterYConstraints(_ constrain : SwiftyConstraint) {
         guard  case .centerYAnchorConstraint(inView: let inView, relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }

         var constraint: NSLayoutConstraint
         
        switch relation {
        case .equalTo:
            constraint = centerYAnchor.constraint(equalTo: inView.centerYAnchor, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = centerYAnchor.constraint(greaterThanOrEqualTo: inView.centerYAnchor, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = centerYAnchor.constraint(lessThanOrEqualTo: inView.centerYAnchor, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .centerY else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
         
   
         
         constraint.isActive = true
        
    }
}
