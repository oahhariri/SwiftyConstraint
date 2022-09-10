//
//  SwiftyConstriens.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 07/06/2022.
//

import UIKit

/// keep reference of constriens
public struct SwiftyConstraintAnimated {
    let id: String
    public init (_ id: String) {
        self.id = id
    }
}

public struct SwiftyConstraint {
    
    let constraint: SwiftyConstraintTypes
    
    internal init(_ constraint: SwiftyConstraintTypes) {
        self.constraint = constraint
    }
}



public extension UIView {
    
    /// add and activate Constraint
    func anchor(_ constrain: SwiftyConstraint) {
        translatesAutoresizingMaskIntoConstraints = false
        anchorHelper(constrain)
    }

    /// add and activate list of Constraints
    func anchor(_ constraines : [SwiftyConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        
        for constrain in constraines {
            anchorHelper(constrain)
        }
        
    }
    
    /// add and activate list of Constraint
    fileprivate func anchorHelper(_ constrain: SwiftyConstraint) {
        switch constrain.constraint {
        case .preDefinedAnchorConstraint(let constrain):
            handelPredefindesConstrain(constrain)
        default:
            activeConstraint(constrain)
        }
    }


    fileprivate func activeConstraint(_ constrain : SwiftyConstraint) {
        
        switch constrain.constraint {
            
        case .topAnchorConstraint:
            setTopConstraints(constrain)
        case .leadingAnchorConstraint:
            setLeadingConstraints(constrain)
        case .bottomAnchorConstraint:
             setBottomConstraints(constrain)
        case .trailingAnchorConstraint:
             setTrailingConstraints(constrain)
        case .leftAnchorConstraint:
             setLeftConstraints(constrain)
        case .rightAnchorConstraint:
             setRightConstraints(constrain)
        case .centerXAnchorConstraint:
             setCenterXConstraints(constrain)
        case .centerYAnchorConstraint:
             setCenterYConstraints(constrain)
        case .widthAnchorConstraintConstant:
             setWidthConstraintsConstant(constrain)
        case .widthAnchorConstraint:
             setWidthConstraints(constrain)
        case .heightAnchorConstraint:
             setHeightConstraints(constrain)
        case .heightAnchorConstraintConstant:
             setHeightConstraintsConstant(constrain)
        default:
            break
        }
    }
    
    
    fileprivate func handelPredefindesConstrain(_ constrain: SwiftyConstraintPreDefined) {
        
        switch constrain {
        case .fill(let view, let padding):
            anchor([.top(view.topAnchor , padding), .bottom(view.bottomAnchor , padding == 0 ? padding : -padding), .leading(view.leadingAnchor , padding), .trailing(view.trailingAnchor , padding == 0 ? padding : -padding)])
        case .fillX(let view, let padding):
            anchor([.leading(view.leadingAnchor , padding), .trailing(view.trailingAnchor , padding == 0 ? padding : -padding)])
        case .fillY(let view, let padding):
            anchor([.top(view.topAnchor, padding), .bottom(view.bottomAnchor, -padding)])
        case .center(let view):
            anchor([.centerX(view), .centerY(view)])
        case .size(let size):
            anchor([.height(size), .width(size)])
        }
    }
    
    func animate(_ constraint: SwiftyConstraintAnimated, _ constant: CGFloat) {
        
        guard let constraines = constraintWith(identifier: constraint.id) else{
           return
        }
        constraines.constant = constant
    }
    
    fileprivate func constraintWith(identifier: String) -> NSLayoutConstraint?{
        return self.constraints.first(where: {$0.identifier == identifier})
    }
    
}
