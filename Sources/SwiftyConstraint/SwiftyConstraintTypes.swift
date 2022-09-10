//
//  SwiftyConstraintTypes.swift
//  Phot
//
//  Created by Abdulrahman Hariri on 10/09/2022.
//

import UIKit

internal enum SwiftyConstraintTypes {
    /// add topAnchor Constraint with configration , Do not use this Directly
    case topAnchorConstraint(anchor:NSLayoutYAxisAnchor , relation: ConstraintRelation, option: [ConstraintOption])
    /// add leadingAnchor Constraint with configration , Do not use this Directly
    case leadingAnchorConstraint(anchor:NSLayoutXAxisAnchor , relation: ConstraintRelation, option: [ConstraintOption])
    /// add bottomAnchor Constraint with configration , Do not use this Directly
    case bottomAnchorConstraint(anchor:NSLayoutYAxisAnchor , relation: ConstraintRelation, option: [ConstraintOption])
    /// add trailingAnchor Constraint with configration , Do not use this Directly
    case trailingAnchorConstraint(anchor:NSLayoutXAxisAnchor , relation: ConstraintRelation, option: [ConstraintOption])
    /// add leftAnchor Constraint with configration , Do not use this Directly
    case leftAnchorConstraint(anchor:NSLayoutXAxisAnchor , relation: ConstraintRelation, option: [ConstraintOption])
    /// add rightAnchor Constraint with configration , Do not use this Directly
    case rightAnchorConstraint(anchor:NSLayoutXAxisAnchor , relation: ConstraintRelation, option: [ConstraintOption])
    /// add centerXAnchor Constraint with configration , Do not use this Directly
    case centerXAnchorConstraint(inView:UIView, relation: ConstraintRelation, option: [ConstraintOption])
    /// add centerYAnchor Constraint with configration , Do not use this Directly
    case centerYAnchorConstraint(inView:UIView, relation: ConstraintRelation, option: [ConstraintOption])
    /// add widthAnchor Constraint with configration , Do not use this Directly
    case widthAnchorConstraintConstant(relation: RelationDimension, option: [DimensionConstraintOption])
    /// add widthAnchor Constraint with configration , Do not use this Directly
    case widthAnchorConstraint(anchor:NSLayoutDimension, relation: ConstraintRelation, option: [DimensionConstraintOption])
    /// add heightAnchor Constraint with configration , Do not use this Directly
    case heightAnchorConstraintConstant(relation: RelationDimension, option: [DimensionConstraintOption])
    /// add heightAnchor Constraint with configration , Do not use this Directly
    case heightAnchorConstraint(anchor:NSLayoutDimension, relation: ConstraintRelation, option: [DimensionConstraintOption])
    /// add Constraint with configration , Do not use this Directly
    case preDefinedAnchorConstraint(_ :SwiftyConstraintPreDefined)
}

/// set of pre-defined to make it ease to add set of constriens at once
internal enum SwiftyConstraintPreDefined {
    /// add top , leading , trailing and bottom anchor
    case fill(_ view: UIView, _ padding: CGFloat = 0)
    /// add top and leading anchor
    case fillX(_ view: UIView, _ padding: CGFloat = 0)
    /// add top and bottom anchor
    case fillY(_ View: UIView, _ padding: CGFloat = 0)
    /// add centerX and centerY anchor
    case center(_ inView: UIView)
    /// add equal width and height anchor
    case size(_ constant: CGFloat)
}
