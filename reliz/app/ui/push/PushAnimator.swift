//
//  PushAnimator.swift
//  reliz
//
//  Created by Sergey Romanenko on 07.07.2021.
//

import UIKit

class PushAnimator: NSObject {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    let duration: TimeInterval = 0.5
    var direction: Direction
    
    init(direction: Direction = .presentation) {
        self.direction = direction
        super.init()
    }
}

extension PushAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval { duration }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.viewController(forKey: .from)?.view,
              let toView = transitionContext.viewController(forKey: .to)?.view else { return }
        
        switch direction {
        case .presentation: fromBottom(fromView, to: toView, context: transitionContext)
        case .dismissal: fromTop(fromView, to: toView, context: transitionContext)
        }
    }
    
    private func fromBottom(_ from: UIView, to: UIView, context:  UIViewControllerContextTransitioning) {
        context.containerView.addSubview(to)
        
        to.transform = CGAffineTransform(translationX: 0, y: screenHeight)
        UIView.animate(withDuration: duration, animations: {
            to.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { _ in
            context.completeTransition(true)
        }
        
    }
    
    private func fromTop(_ from: UIView, to: UIView, context: UIViewControllerContextTransitioning) {
        context.containerView.addSubview(to)
            
        to.transform = CGAffineTransform(translationX: 0, y: -screenHeight)
            UIView.animate(withDuration: duration, animations: {
                to.transform = CGAffineTransform(translationX: 0, y: 0)
                
            }) { (_) in
                context.completeTransition(true)
            }
        }
}

extension PushAnimator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? { PushAnimator(direction: direction) }
}
