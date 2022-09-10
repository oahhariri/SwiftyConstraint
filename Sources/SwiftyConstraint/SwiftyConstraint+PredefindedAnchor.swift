//
//  SwiftyConstraint+PredefindedAnchor.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 08/06/2022.
//

import UIKit

// MARK: - Handel pre-definded Anchor contriens

public extension SwiftyConstraint {
    /// add top , leading , trailing and bottom Constraints
    static func fill(_ view:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.preDefinedAnchorConstraint(.fill(view, padding)))
     }
    /// add leading , trailing  Constraints
    static func fillX(_ view:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.preDefinedAnchorConstraint(.fillX(view, padding)))
     }

    /// add top , bottom Constraints
    static func fillY(_ view:UIView,_ padding:CGFloat = 0) -> SwiftyConstraint {
        SwiftyConstraint(.preDefinedAnchorConstraint(.fillY(view, padding)))
     }

    static func center(_ inView:UIView) -> SwiftyConstraint {
  
        SwiftyConstraint( .preDefinedAnchorConstraint(.center(inView)))
     }
    
    /// add width , height  Constraints
    static func size(_ constant:CGFloat) -> SwiftyConstraint {
        SwiftyConstraint(.preDefinedAnchorConstraint(.size(constant)))
     }
}
