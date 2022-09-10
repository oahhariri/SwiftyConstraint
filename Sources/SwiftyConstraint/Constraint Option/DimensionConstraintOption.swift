//
//  DimensionConstraintOption.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 10/09/2022.
//

import UIKit


public enum DimensionConstraintOption {
   /// Add padding to the constraint
   case constant (_: CGFloat)
   /// Add multiplier to the constraint
   case multiplier (_: CGFloat)
   /// set priority of the constraint
   case priority (_: Float)
   /// set constraint as animated , when set the constraint will be asigned an ID, that id will be used later to animate the constraint
   /// - Parameter : id of the constraint , id must be unique
   case animated (_: SwiftyConstraintAnimated)
   

}

internal extension Array where Element == DimensionConstraintOption {
   var constant: CGFloat {
       for option in self {
           guard case .constant(let padding) = option else {continue}
           return padding
       }
       return 0
   }
   
   var priority: Float? {
       for option in self {
           guard case .priority(let priority) = option else {continue}
           return priority
       }
       return nil
   }
   
   var multiplier: CGFloat {
       for option in self {
           guard case .multiplier(let multiplier) = option else {continue}
           return multiplier
       }
       return 1.0
   }
   
   
   var id: String? {
       for option in self {
           guard case .animated(let animated) = option else {continue}
           return animated.id
       }
       return nil
   }
   
   
}
