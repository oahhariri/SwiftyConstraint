//
//  SwiftyConstriens+HeightConstiens.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 08/06/2022.
//

import UIKit
// MARK: - Handel equal to constant value
public extension SwiftyConstraint {
    
    /// Add heightAnchor.constraint(equalToConstant)  with constant value
    /// - Parameter constant:
    static func height (_ constant: CGFloat) -> SwiftyConstraint {
        SwiftyConstraint(.heightAnchorConstraintConstant(relation: .equalToConstant, option: [.constant(constant)] ))
    }
    
    /// Add heightAnchor.constraint(equalToConstant)  with more configuration
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
    
    static func height (_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint(.heightAnchorConstraintConstant(relation: .equalToConstant, option: option ))
    }
    
    /// Add heightAnchor.constraint(greaterThanOrEqulToConstant)  with constant value
    /// - Parameter constant:
    static func heightGreaterOrEqual (_ constant: CGFloat)  -> SwiftyConstraint {
        SwiftyConstraint(.heightAnchorConstraintConstant(relation: .greaterThanOrEqulToConstant, option: [.constant(constant)] ))
    }
    
    /// Add heightAnchor.constraint(greaterThanOrEqulToConstant)  with more configuration
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
    
    static func heightGreaterOrEqual (_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .heightAnchorConstraintConstant(relation: .greaterThanOrEqulToConstant, option:  option ))
    }
    /// Add heightAnchor.constraint(lessThanOrEqulToConstant)  with constant value
    /// - Parameter constant:
    
    static func heightLessOrEqual (_ constant: CGFloat)  -> SwiftyConstraint {
        SwiftyConstraint(.heightAnchorConstraintConstant(relation: .lessThanOrEqulToConstant, option: [.constant(constant)] ))
    }
    
    /// Add heightAnchor.constraint(lessThanOrEqulToConstant)  with more configuration
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
    
    static func heightLessOrEqual (_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .heightAnchorConstraintConstant(relation: .lessThanOrEqulToConstant, option: option ))
    }
    
    
}


internal extension UIView {
    
     func setHeightConstraintsConstant(_ constrain : SwiftyConstraint) {
         guard case .heightAnchorConstraintConstant(relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match") }

         var constraint: NSLayoutConstraint
  
        switch relation {
        case .equalToConstant:
            constraint = heightAnchor.constraint(equalToConstant:info.constant)
        case .greaterThanOrEqulToConstant:
            constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: info.constant)
        case .lessThanOrEqulToConstant:
            constraint = heightAnchor.constraint(lessThanOrEqualToConstant: info.constant)
        }
        
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .height else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
         
         constraint.identifier = info.id
         
         constraint.isActive = true
        
    }
}


// MARK: - Handel equal to another NSLayoutDimension
public extension SwiftyConstraint {
     
    /// Add heightAnchor.constraint(equalTo) with multiplier
    /// - Parameter with: NSLayoutDimension
    /// - Parameter multiplier:
    /// set multiplier of the constraint
    
    static func heightEqualTo (_ with:NSLayoutDimension, _ multiplier: CGFloat) -> SwiftyConstraint {
        SwiftyConstraint(.heightAnchorConstraint(anchor: with, relation: .equalTo, option: [.multiplier(multiplier)] ))
    }
    
    /// Add heightAnchor.constraint(equalTo)  with more configuration
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
    
    static func heightEqualTo (_ with:NSLayoutDimension,_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .heightAnchorConstraint(anchor: with, relation: .equalTo, option:  option))
    }
    
    /// Add heightAnchor.constraint(greaterThanOrEqulTo) with multiplier
    /// - Parameter with: NSLayoutDimension
    /// - Parameter multiplier:
    /// set multiplier of the constraint
    static func heightGreaterOrEqualTo (_ with:NSLayoutDimension, _ multiplier: CGFloat)  -> SwiftyConstraint {
        SwiftyConstraint( .heightAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: [.multiplier(multiplier)] ))
    }
    
    /// Add heightAnchor.constraint(greaterThanOrEqulTo)  with more configuration
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
    
    static func heightGreaterOrEqualTo (_ with:NSLayoutDimension,_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .heightAnchorConstraint(anchor: with, relation: .greaterThanOrEqulTo, option: option))
    }
    
    
    /// Add heightAnchor.constraint(lessThanOrEqulTo) with multiplier
    /// - Parameter with: NSLayoutDimension
    /// - Parameter multiplier:
    /// set multiplier of the constraint
    
    static func heightLessOrEqualTo (_ with:NSLayoutDimension, _ multiplier: CGFloat)  -> SwiftyConstraint {
        SwiftyConstraint( .heightAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: [.multiplier(multiplier)]))
    }
    
    /// Add heightAnchor.constraint(lessThanOrEqulTo)  with more configuration
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
    
    static func heightLessOrEqualTo (_ with:NSLayoutDimension,_ option:[DimensionConstraintOption]) -> SwiftyConstraint {
        SwiftyConstraint( .heightAnchorConstraint(anchor: with, relation: .lessThanOrEqulTo, option: option))
    }
     
    
}



internal extension UIView {
    
     func setHeightConstraints(_ constrain : SwiftyConstraint) {
         guard case .heightAnchorConstraint(anchor: let anchor , relation: let relation, option: let info) = constrain.constraint else {
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
              }

         var constraint: NSLayoutConstraint!
  
        switch relation {
        case .equalTo:
            constraint = heightAnchor.constraint(equalTo: anchor, multiplier: info.multiplier , constant: info.constant)
        case .greaterThanOrEqulTo:
            constraint = heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: info.multiplier, constant: info.constant)
        case .lessThanOrEqulTo:
            constraint = heightAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: info.multiplier, constant: info.constant) 
        }
        
         
         
        if let priority = info.priority {
            constraint.priority = UILayoutPriority.init(rawValue: priority)
        }
         
         guard constraint.firstAttribute == .height else{
             fatalError("SwiftyConstraint Error - Constraint type dose not match")
         }
         
         constraint.identifier = info.id
         
         constraint.isActive = true
        
    }
}
 
