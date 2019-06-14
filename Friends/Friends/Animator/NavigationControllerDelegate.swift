//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Stephanie Bowles on 6/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit


class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: UITableViewCell?
    let animator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        toVC.loadViewIfNeeded()
        
        if let toVC = toVC  as? FriendsDetailViewController,
            let sourceCell = sourceCell {
            
            animator.sourceImageView  = sourceCell.imageView
            animator.destinationImageView = toVC.pictureView
            
            animator.sourceNameLabel = sourceCell.textLabel
            animator.destinationNameLabel = toVC.nameLabel
            
        }  else if let fromVC = fromVC as? FriendsDetailViewController {
            
            animator.destinationImageView = sourceCell?.imageView
            animator.sourceImageView = fromVC.pictureView
            
            animator.destinationNameLabel = sourceCell?.textLabel
            animator.sourceNameLabel = fromVC.nameLabel
        }
        
        
        return animator
    }
    
    
    
//    method, create and configure an Animator object, and return it. The animator will need to have its source and destination imageView and label properties set. Note: You must keep a strong reference to the animator object in your navigation controller delegate. Use a property to hold it instead of creating a temporary instance and referencing it solely in this method.
}
