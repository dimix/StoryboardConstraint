# StoryboardConstraint
A simple way to use programmatically Autolayout Constraint created in Storyboard.

![alt tag](https://raw.githubusercontent.com/dimix/StoryboardConstraint/master/readme-images/demo.gif)

## Features
- Predefined basic constraints: top, bottom, leading, trailing, height, width, centerX, centerY
- A complete method to find a specific constraint through the views

## How to Use

#### 1. Add UIView+StoryboardConstraint.swift on your project
#### 2. Get the constraints

You can get the constraint set in Storyboard like this:

```swift
customView.heightConstraint?.constant = 200
customView.topConstraint?.constant = 20
```

You can also set a custom constraint identifier and get it like this:

```swift
view.constraint(withIdentifier: "customWidth", searchInSubviews: true)?.constant = 50
```

If you want you can get all the constraints with a specified attribute like this:

```swift
view.constraints(withAttribute: .height)
```
This method returns all the constraints found ordered by priority.

## Requirements

Current version is compatible with:

* Swift 3.0+
* iOS 9 or later
