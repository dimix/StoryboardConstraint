//
//  ViewController.swift
//  StoryboardConstraint
//
//  Created by Dimitri Giani on 18/02/2017.
//  Copyright © 2017 Dimitri Giani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var label:UILabel?
	@IBOutlet weak var subView:UIView?
	@IBOutlet weak var subSubView:UIView?
	@IBOutlet weak var subView2:UIView?
	@IBOutlet weak var squareView:UIView?
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
	}

	override func viewDidAppear(_ animated: Bool)
	{
		super.viewDidAppear(animated)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1)
		{
			self.view.constraint(withIdentifier: "customWidth", searchInSubviews: true)?.constant = 50
			self.view.constraint(withIdentifier: "customHeight", searchInSubviews: true)?.constant = 50
			
			self.label?.topConstraint?.constant = 50
			self.label?.bottomConstraint?.constant = 50
			
			self.subView?.heightConstraint?.constant = 200
			self.subView?.proportionalWidthConstraint?.constant = -50

			self.subSubView?.proportionalHeightConstraint?.constant = 0

			self.subView2?.leadingConstraint?.constant = 50
			self.subView2?.trailingConstraint?.constant = 50
			self.subView2?.topConstraint?.constant = 40
			self.subView2?.bottomConstraint?.constant = 100

			self.squareView?.widthConstraint?.constant = 40
			self.squareView?.heightConstraint?.constant = 40
			
			self.squareView?.centerXConstraint?.constant = -40
			self.squareView?.centerYConstraint?.constant = 40
			
			self.view.setNeedsUpdateConstraints()
			
			UIView.animate(withDuration: 1, animations: {
				
				self.view.layoutIfNeeded()
				
			})
		}
	}
}

