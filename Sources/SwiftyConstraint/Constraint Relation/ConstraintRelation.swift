//
//  ConstraintRelation.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 10/09/2022.
//

import Foundation


/// Dimension Constraint Relation
public enum RelationDimension  {
    case equalToConstant
    case greaterThanOrEqulToConstant
    case lessThanOrEqulToConstant
}

/// Constraint Relation
public enum ConstraintRelation {
    case equalTo
    case greaterThanOrEqulTo
    case lessThanOrEqulTo
}
