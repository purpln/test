//
//  PopUpTransitionManager.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

class PopUpTransition: NSObject, UIViewControllerTransitioningDelegate {
    private lazy var popUpAnimator = PopUpAnimator()
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let controller = PopUpPresentationController(presentedViewController: presented, presenting: presenting)
        return controller
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popUpAnimator.direction = .presentation
        return popUpAnimator
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popUpAnimator.direction = .dismissal
        return popUpAnimator
    }

    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if popUpAnimator.interactive { return popUpAnimator }
        return nil
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if popUpAnimator.interactive { return popUpAnimator }
        return nil
    }
}
