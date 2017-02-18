//
//  UIView+StoryboardConstraint.swift
//
//  Created by Dimitri Giani on 18/02/2017.
//  Copyright © 2017 Dimitri Giani. All rights reserved.
//

import UIKit

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

extension UIView
{
	var widthConstraint:NSLayoutConstraint? { return constraint(withIdentifier: ConstraintIdentifier.width.value) }
	var heightConstraint:NSLayoutConstraint? { return constraint(withIdentifier: ConstraintIdentifier.height.value) }
	
	var proportionalWidthConstraint:NSLayoutConstraint? { return superview?.constraint(withIdentifier: ConstraintIdentifier.width.value, firstItem: self) }
	var proportionalHeightConstraint:NSLayoutConstraint? { return superview?.constraint(withIdentifier: ConstraintIdentifier.height.value, firstItem: self) }
	
	var topConstraint:NSLayoutConstraint? { return superview?.constraint(withIdentifier: ConstraintIdentifier.top.value, firstItem: self) }
	var bottomConstraint:NSLayoutConstraint? { return superview?.constraint(withIdentifier: ConstraintIdentifier.bottom.value, secondItem: self) }
	
	var leadingConstraint:NSLayoutConstraint? { return superview?.constraint(withIdentifier: ConstraintIdentifier.leading.value, firstItem: self) }
	var trailingConstraint:NSLayoutConstraint? { return superview?.constraint(withIdentifier: ConstraintIdentifier.trailing.value, secondItem: self) }
	
	var xAlignConstraint:NSLayoutConstraint? { return superview?.constraint(withIdentifier: ConstraintIdentifier.xAlign.value, firstItem: self) }
	var yAlignConstraint:NSLayoutConstraint? { return superview?.constraint(withIdentifier: ConstraintIdentifier.yAlign.value, firstItem: self) }
	
	public func constraint(withIdentifier identifier:String, firstItem: UIView? = nil, secondItem: UIView? = nil, searchInSubviews:Bool = false) -> NSLayoutConstraint?
	{
		var constraint:NSLayoutConstraint?
		
		for aConstraint in constraints
		{
			if aConstraint.identifier == identifier
			{
				//	If provided, try to check if this constraint is attached to the passed view.
				//	This beacuse top, bottom, leading and trailing constraint are set to the superview and not in the view itself.
				
				if let firstItem = firstItem
				{
					if firstItem == (aConstraint.firstItem as? UIView)
					{
						constraint = aConstraint
					}
				}
				else if let secondItem = secondItem
				{
					if secondItem == (aConstraint.secondItem as? UIView)
					{
						constraint = aConstraint
					}
				}
				else
				{
					constraint = aConstraint
				}
				
				if constraint != nil
				{
					break
				}
			}
		}
		
		//	If requested and the constraint isn't find, search through the subviews
		
		if constraint == nil && searchInSubviews
		{
			for subview in subviews
			{
				constraint = subview.constraint(withIdentifier: identifier, firstItem: firstItem, secondItem: secondItem, searchInSubviews: searchInSubviews)
				if constraint != nil { break }
			}
		}
		
		return constraint
	}
}
