//
//  UIView+StoryboardConstraint.swift
//
//  Created by Dimitri Giani on 18/02/2017.
//  Copyright © 2017 Dimitri Giani. All rights reserved.
//

import UIKit

extension UIView
{
	var widthConstraint:NSLayoutConstraint? { return constraint(withAttribute: .width) }
	var heightConstraint:NSLayoutConstraint? { return constraint(withAttribute: .height) }

	var proportionalWidthConstraint:NSLayoutConstraint? { return superview?.constraint(withAttribute: .width, firstItem: self) }
	var proportionalHeightConstraint:NSLayoutConstraint? { return superview?.constraint(withAttribute: .height, firstItem: self) }
	
	var topConstraint:NSLayoutConstraint? { return superview?.constraint(withAttribute: .top, firstItem: self) }
	var bottomConstraint:NSLayoutConstraint? { return superview?.constraint(withAttribute: .bottom, secondItem: self) }
	
	var leadingConstraint:NSLayoutConstraint? { return superview?.constraint(withAttribute: .leading, firstItem: self) }
	var trailingConstraint:NSLayoutConstraint? { return superview?.constraint(withAttribute: .trailing, secondItem: self) }
	
	var xAlignConstraint:NSLayoutConstraint? { return superview?.constraint(withAttribute: .centerX, firstItem: self) }
	var yAlignConstraint:NSLayoutConstraint? { return superview?.constraint(withAttribute: .centerY, firstItem: self) }
	
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
	
	public func constraint(withAttribute attribute: NSLayoutAttribute, firstItem: UIView? = nil, secondItem: UIView? = nil, searchInSubviews:Bool = false) -> NSLayoutConstraint?
	{
		var constraint:NSLayoutConstraint?
		
		for aConstraint in constraints
		{
			if aConstraint.firstAttribute == attribute || aConstraint.secondAttribute == attribute
			{
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
					if aConstraint.firstAttribute == attribute
					{
						constraint = aConstraint
					}
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
				constraint = subview.constraint(withAttribute: attribute, firstItem: firstItem, secondItem: secondItem, searchInSubviews: searchInSubviews)
				if constraint != nil { break }
			}
		}
		
		return constraint
	}
}
