# SwiftyConstraint

easy to use Constraint for UIKit view

## Setup
* SPM 

 ```
https://github.com/oahhariri/SwiftyConstraint.git
 ```
* Cocopods 

```
pod 'SwiftyConstraint'
```


## Usage

```
mainView.anchor([.fill(self, 0)])
button.anchor([.fill(mainView, 0)])
        
icon.anchor([.leading(mainView.leadingAnchor, 8), .size(25)])
nextIcon.anchor([.size(15), .trailing(mainView.trailingAnchor,-7)])        
```
