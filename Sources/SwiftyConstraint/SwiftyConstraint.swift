
#if !os(macOS)
import UIKit


public enum SwiftyConstraintAnimated {
    case constraint(_ with:NSLayoutConstraint)
    
    func animate(constant: CGFloat) {
        switch self {
        case .constraint(let constraines):
            constraines.constant = constant
        }
    }
}

public enum SwiftyConstraintOption {
    case constant(_ value: CGFloat)
    case multiplier(_ value: CGFloat)
}

public enum ViewConstraint {
     
     case top(_ with:NSLayoutYAxisAnchor,_ padding:CGFloat = 0)
     case leading(_ with:NSLayoutXAxisAnchor,_ padding:CGFloat? = 0)
     case bottom(_ with:NSLayoutYAxisAnchor,_ padding:CGFloat = 0)
     case trailing(_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0)
     case left(_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0)
     case right(_ with:NSLayoutXAxisAnchor,_ padding:CGFloat = 0)
     case fill(_ View:UIView,_ padding:CGFloat = 0)
     case fillX(_ View:UIView,_ padding:CGFloat = 0)
     case fillY(_ View:UIView,_ padding:CGFloat = 0)
     case center(_ inView:UIView)
     case centerX(_ inView:UIView,_ padding:CGFloat = 0)
     case centerY(_ inView:UIView,_ padding:CGFloat = 0)
     case size(_ constant:CGFloat)
     case width(_ constant:CGFloat)
     case height(_ constant:CGFloat)
     
     case widthEqualTo(_ with:NSLayoutDimension,_ option:SwiftyConstraintOption)
     case heightEqualTo(_ with:NSLayoutDimension,_ option:SwiftyConstraintOption)
     
     case widthGreaterOrEqualTo(_ with:NSLayoutDimension,_ option:SwiftyConstraintOption)
     case widthLessOrEqualTo(_ with:NSLayoutDimension,_ option:SwiftyConstraintOption)
     case widthGreaterOrEqualToConstant(_ constant:CGFloat)
     case widthLessOrEqualToConstant(_ constant:CGFloat)
 
     
     case heightGreaterOrEqualTo(_ with:NSLayoutDimension,_ option:SwiftyConstraintOption)
     case heightLessOrEqualTo(_ with:NSLayoutDimension,_ option:SwiftyConstraintOption)
     case heightGreaterOrEqualToConstant(_ constant:CGFloat)
     case heightLessOrEqualToConstant(_ constant:CGFloat)
     
     var isPredifinded: Bool {
        switch self {
        case .fill, .fillX, .fillY, .center, .size:
            return false
        default: return true
    
        }
    }
    
}

public extension UIView {

    func anchor(_ constraines : ViewConstraint) -> SwiftyConstraintAnimated? {
        
        
        guard constraines.isPredifinded else {return nil}
        
        guard let constraint = constriensHelper(constraines) else{return nil}
         constraint.isActive = true
        
        return .constraint(constraint)
      
    }
    
    func anchor(_ constraines : [ViewConstraint]) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        for constrain in constraines {
            switch constrain {
                
            case .center(let view):
                anchor([.centerX(view), .centerY(view)])
            case .fill(let view, let padding):
                anchor([.top(view.topAnchor , padding), .bottom(view.bottomAnchor , padding == 0 ? padding : -padding), .leading(view.leadingAnchor , padding), .trailing(view.trailingAnchor , padding == 0 ? padding : -padding)])
                
            case .fillX(let view, let padding):
                anchor([.leading(view.leadingAnchor , padding), .trailing(view.trailingAnchor , -padding)])
            case .fillY(let view, let padding):
                anchor([.top(view.topAnchor, padding), .bottom(view.bottomAnchor, -padding)])
            case .size(let size):
                anchor([.height(size), .width(size)])
            
 
            default:
                guard let constraint = constriensHelper(constrain) else{return}
                constraint.isActive = true
                 
            }
        }
        
    }
    
    
    fileprivate func constriensHelper(_ constrain : ViewConstraint) -> NSLayoutConstraint? {
        
        guard constrain.isPredifinded else{return nil}
        
        switch constrain {
        case .top(let with, let padding):
            
            let constraint = topAnchor.constraint(equalTo: with, constant: padding)
          
         return constraint
            
        case .leading(let with, let padding):
            
            let constraint = leadingAnchor.constraint(equalTo: with, constant: padding ?? 0)
           
            return constraint
            
        case .bottom(let with, let padding):
            
            let constraint = bottomAnchor.constraint(equalTo: with, constant: padding)
    
            return constraint
            
        case .trailing(let with, let padding):
            
            let constraint = trailingAnchor.constraint(equalTo: with, constant: padding)
          
            return constraint
            
        case .left(let with, let padding):
            
            let constraint = leftAnchor.constraint(equalTo: with, constant: padding)
           
            return constraint
            
        case .right(let with, let padding):
            
            let constraint = rightAnchor.constraint(equalTo: with, constant: padding)
          
            return constraint
             
        case .centerX(let view, let padding):
            
            let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor , constant: padding)
            return constraint
            
        case .centerY(let view, let padding):
            
            let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: padding)
            return constraint
            
    
        case .width(let constant):
            let constraint = widthAnchor.constraint(equalToConstant: constant)
           
            return constraint
        case .height(let constant):
          
            let constraint = heightAnchor.constraint(equalToConstant: constant)
            
            return constraint
 
        case .widthEqualTo(let with, let option ):
            
            switch option {
            case .multiplier(let value):
                let constraint = widthAnchor.constraint(equalTo: with, multiplier: value)
                return constraint
            case .constant(let value):
                let constraint = widthAnchor.constraint(equalTo: with, constant: value)
                return constraint
            }
        
        case .heightEqualTo(let with, let option ):
            
            switch option {
            case .multiplier(let value):
                let constraint = heightAnchor.constraint(equalTo: with, multiplier: value)
                return constraint
            case .constant(let value):
                let constraint = heightAnchor.constraint(equalTo: with, constant: value)
                return constraint
            }
             
        case .widthGreaterOrEqualTo(let with, let option):
            
            switch option {
            case .multiplier(let value):
                let constraint = widthAnchor.constraint(greaterThanOrEqualTo: with, multiplier: value)
                return constraint
            case .constant(let value):
                let constraint = widthAnchor.constraint(greaterThanOrEqualTo: with, constant: value)
                return constraint
            }
             
        case .widthLessOrEqualTo(let with, let option):
            
            
            switch option {
            case .multiplier(let value):
                let constraint = widthAnchor.constraint(lessThanOrEqualTo: with, multiplier: value)
                return constraint
            case .constant(let value):
                let constraint = widthAnchor.constraint(lessThanOrEqualTo: with, constant: value)
                return constraint
            }
            
        case .widthGreaterOrEqualToConstant(let constant):
            
            let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            return constraint
          
        case .widthLessOrEqualToConstant(let constant):
            let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
            return constraint
        case .heightGreaterOrEqualTo(let with, let option):
            
            switch option {
            case .multiplier(let value):
                let constraint = heightAnchor.constraint(equalTo: with, multiplier: value)
                return constraint
            case .constant(let value):
                let constraint = heightAnchor.constraint(equalTo: with, constant: value)
                return constraint
            }
            
            
//            let constraint = heightAnchor.constraint(equalTo: with, multiplier: multiplier)
//            return constraint
        case .heightLessOrEqualTo (let with, let option):
            
            switch option {
            case .multiplier(let value):
                let constraint = heightAnchor.constraint(lessThanOrEqualTo: with, multiplier: value)
                return constraint
            case .constant(let value):
                let constraint = heightAnchor.constraint(lessThanOrEqualTo: with, constant: value)
                return constraint
            }
            
            
            
        case .heightGreaterOrEqualToConstant(let constant):
        
            let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            return constraint
            
            
        case .heightLessOrEqualToConstant(let constant):
        
            let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            return constraint
            
        default: return nil
        }
    }
    
}
#endif

