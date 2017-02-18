# StroryboardConstraint
A simple way to use programmatically Autolayout Constraint created in Storyboard.

![alt tag](https://raw.githubusercontent.com/dimix/StroryboardConstraint/master/readme-images/demo.gif)

## Features
- Predefined basic constraints: top, bottom, leading, trailing, height, width, xAlign, yAlign
- A complete method to find a specific constraint through the views

## How to Use

#### 1. Add UIView+StoryboardConstraint.swift on your project
#### 2. Configure constraints identifier.
The predefined keys are defined in ConstraintIdentifier enum:

```swift
enum ConstraintIdentifier:String {
	case width = "width"
	case height = "height"
	case top = "top"
	case bottom = "bottom"
	case leading = "leading"
	case trailing = "trailing"
	case xAlign = "xAlign"
	case yAlign = "yAlign"
	
	var value:String { return rawValue }
}
```
![alt tag](https://raw.githubusercontent.com/dimix/StroryboardConstraint/master/readme-images/screen1.png)
![alt tag](https://raw.githubusercontent.com/dimix/StroryboardConstraint/master/readme-images/screen2.png)
![alt tag](https://raw.githubusercontent.com/dimix/StroryboardConstraint/master/readme-images/screen3.png)

Then you can find the constraint like this:

```swift
customView.heightConstraint?.constant = 200
customView.topConstraint?.constant = 20
```

You can also set a custom constraint identifier and get it:

```swift
view.constraint(withIdentifier: "customWidth", searchInSubviews: true)?.constant = 50
```

## Requirements

Current version is compatible with:

* Swift 3.0+
* iOS 9 or later
