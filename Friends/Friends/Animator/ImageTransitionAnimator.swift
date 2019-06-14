//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Stephanie Bowles on 6/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
   
//    Add properties for the views that the animator will need to know about. These are the source and destination photo views, and the source and destination name labels.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
}
