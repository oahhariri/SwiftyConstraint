//
//  SwiftyConstriens+WidthConstiens.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 08/06/2022.
//

import UIKit

// MARK: - Handel equal to constant value
public extension SwiftyConstraint {
     
    /// Add widthAnchor.constraint(equalToConstant)  with constant value
    /// - Parameter constant:
    
    static func width (_ constant: CGFloat) -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraintConstant(relation: .equalToConstant, option: .init([.constant(constant)])))
    }

    /// Add widthAnchor.constraint(equalToConstant)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - multiplier (_: CGFloat)
    ///  - priority (_: Float)
    ///  - animated (_: SwiftyConstraintAnimated)
    ///
    /// - Parameter option: more options to configure the constriens
    
    static func width (_ option: [DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraintConstant(relation: .equalToConstant, option: .init(option)))
    }

    /// Add widthAnchor.constraint(greaterThanOrEqulToConstant)  with constant value
    /// - Parameter constant:
    static func widthGreaterOrEqual (_ constant: CGFloat)  -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraintConstant(relation: .greaterThanOrEqulToConstant, option: .init([.constant(constant)])))
    }

    
    
    /// Add widthAnchor.constraint(greaterThanOrEqulToConstant)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - multiplier (_: CGFloat)
    ///  - priority (_: Float)
    ///  - animated (_: SwiftyConstraintAnimated)
    ///
    /// - Parameter option: more options to configure the constriens
    
    static func widthGreaterOrEqual (_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraintConstant(relation: .greaterThanOrEqulToConstant, option: .init(option)))
    }


    /// Add widthAnchor.constraint(lessThanOrEqulToConstant)  with constant value
    /// - Parameter constant:
    static func widthLessOrEqual (_ constant: CGFloat)  -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraintConstant(relation: .lessThanOrEqulToConstant, option: .init([.constant(constant)])))
    }

    
    /// Add widthAnchor.constraint(lessThanOrEqulToConstant)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - multiplier (_: CGFloat)
    ///  - priority (_: Float)
    ///  - animated (_: SwiftyConstraintAnimated)
    ///
    /// - Parameter option: more options to configure the constriens
    static func widthLessOrEqual (_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .widthAnchorConstraintConstant(relation: .lessThanOrEqulToConstant, option: .init(option)))
    }
    
}


internal extension UIView {
    
     func setWidthConstraintsConstant(_ constrain : SwiftyConstraint) {
         guard case .widthAnchorConstraintConstant(relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }

         var constraint: NSLayoutConstraint
  
        switch relation {
        case .equalToConstant:
            constraint = widthAnchor.constraint(equalToConstant:info.constant)
        case .greaterThanOrEqulToConstant:
            constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: info.constant)
        case .lessThanOrEqulToConstant:
            constraint = widthAnchor.constraint(lessThanOrEqualToConstant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .width else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
         
         constraint.identifier = info.id
         
         constraint.isActive = true
        
    }
}



// MARK: - Handel equal to another NSLayoutDimension
public extension SwiftyConstraint {
    
    /// Add widthAnchor.constraint(equalTo) with multiplier
    /// - Parameter with: NSLayoutDimension
    /// - Parameter multiplier:
    /// set multiplier of the constraint
    static func widthEqualTo (_ with:NSLayoutDimension, _ multiplier: CGFloat) -> SwiftyConstraint {
        SwiftyConstraint( .widthAnchorConstraint(anchor: with, relation: .equalTo, option: .init([.multiplier(multiplier)])))
    }

    
    /// Add widthAnchor.constraint(equalTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - multiplier (_: CGFloat)
    ///  - priority (_: Float)
    ///  - animated (_: SwiftyConstraintAnimated)
    ///
    /// - Parameter with: NSLayoutDimension
    /// - Parameter option: more options to configure the constriens
    static func widthEqualTo (_ with:NSLayoutDimension,_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraint(anchor: with, relation: .equalTo, option: .init(option)))
    }

    /// Add widthAnchor.constraint(greaterThanOrEqulTo) with multiplier
    /// - Parameter with: NSLayoutDimension
    /// - Parameter multiplier:
    /// set multiplier of the constraint
    static func widthGreaterOrEqualTo (_ with:NSLayoutDimension, _ multiplier: CGFloat)  -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: .init([.multiplier(multiplier)])))
    }

    
    /// Add widthAnchor.constraint(greaterThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - multiplier (_: CGFloat)
    ///  - priority (_: Float)
    ///  - animated (_: SwiftyConstraintAnimated)
    ///
    /// - Parameter with: NSLayoutDimension
    /// - Parameter option: more options to configure the constriens
    static func widthGreaterOrEqualTo (_ with:NSLayoutDimension,_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: .init(option)))
    }


    /// Add widthAnchor.constraint(lessThanOrEqulTo) with multiplier
    /// - Parameter with: NSLayoutDimension
    /// - Parameter multiplier:
    /// set multiplier of the constraint
    
    static func widthLessOrEqualTo (_ with:NSLayoutDimension, _ multiplier: CGFloat)  -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: .init([.multiplier(multiplier)])))
    }

    
    /// Add widthAnchor.constraint(lessThanOrEqulTo)  with more configuration
    ///
    /// Add constraint with more configuration ,  you can add set of options to configure the constriens
    ///
    ///  Options you can add:
    ///  - constant (_: CGFloat)
    ///  - multiplier (_: CGFloat)
    ///  - priority (_: Float)
    ///  - animated (_: SwiftyConstraintAnimated)
    ///
    /// - Parameter with: NSLayoutDimension
    /// - Parameter option: more options to configure the constriens
    static func widthLessOrEqualTo (_ with:NSLayoutDimension,_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.widthAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: .init(option)))
    }
 
}

internal extension UIView {
    
     func setWidthConstraints(_ constrain : SwiftyConstraint) {
         guard case .widthAnchorConstraint(anchor: let anchor , relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }

         var constraint: NSLayoutConstraint!
  
        switch relation {
        case .equalTo:
       
            constraint = widthAnchor.constraint(equalTo: anchor, multiplier: info.multiplier, constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: info.multiplier, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = widthAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: info.multiplier, constant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .width else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
         
         constraint.identifier = info.id
         
         constraint.isActive = true
        
    }
}



