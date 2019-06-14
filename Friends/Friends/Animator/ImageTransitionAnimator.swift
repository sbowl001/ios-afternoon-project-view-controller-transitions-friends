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
    var sourceImageView: UIImageView?
    var destinationImageView: UIImageView?
    var sourceNameLabel: UILabel?
    var destinationNameLabel: UILabel?
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to),
              let toView = transitionContext.view(forKey: .to) else {return}
        
       //        Create a temporary image view and label to be used for the animation and add them to the transitionContext's containerView.
        guard let toImage = destinationImageView,
              let toLabel = destinationNameLabel,
              let fromImage = sourceImageView,
              let fromLabel = sourceNameLabel  else {return}
        
//        Get the start and end frames for the image view and label.
         let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        
        
        //        Set up any properties that should be set up before beginning the animation. For example, hide the destination views by setting their alpha to 0.0.
        toView.alpha = 0
        
        toLabel.alpha = 0
        fromLabel.alpha = 0
        
        toImage.alpha = 0
        fromImage.alpha = 0
        
      
        let transitionLabelInitialFrame = containerView.convert(fromLabel.bounds, from: fromLabel)
        let transitionImageInitialFrame = containerView.convert(fromImage.bounds, from: fromImage)
        
        
        let transitioningLabel = UILabel(frame: transitionLabelInitialFrame)
        transitioningLabel.textColor = .black
        transitioningLabel.font = fromLabel.font
        transitioningLabel.text = fromLabel.text
        containerView.addSubview(transitioningLabel)
        
        let transitioningImage = UIImageView(frame: transitionImageInitialFrame)
        transitioningImage.image = fromImage.image
        containerView.addSubview(transitioningImage)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        
//        Use UIView.animate() to animate the transition.
        
        UIView.animate(withDuration: transitionDuration, animations: {
            let transitioningLabelEndFrame = containerView.convert(toLabel.bounds, from: toLabel)
            transitioningLabel.frame = transitioningLabelEndFrame
            let transitioningImageEndFrame = containerView.convert(toImage.bounds, from: toImage)
            transitioningImage.frame = transitioningImageEndFrame
            toView.alpha = 1
        }) { (_) in
            toLabel.alpha = 1
            fromLabel.alpha = 1
            toImage.alpha = 1
            fromImage.alpha = 1
            transitioningLabel.removeFromSuperview()
            transitioningImage.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
//        In the animation's completion closure, (re)set the correct properties for the destination views, and remove the temporary animation views. Call transitionContext.completeTransition().

    }
    
}
