//
//  PopUpAnimator.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

class PopUpAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var direction: Direction
    var interactive = false
    let duration: TimeInterval = 0.65
    
    private weak var transitionContext: UIViewControllerContextTransitioning?
    private(set) lazy var presentationAnimator: UIViewPropertyAnimator = setupAnimator(.presentation)
    private(set) lazy var dismissAnimator: UIViewPropertyAnimator = setupAnimator(.dismissal)
    private var interactiveAnimator: UIViewPropertyAnimator {
        switch direction {
        case .presentation: return presentationAnimator
        case .dismissal: return dismissAnimator
        }
    }
    
    init(direction: Direction = .presentation) {
        self.direction = direction
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval { duration }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let animator = animator(transitionContext) else { return }
        animator.startAnimation()
    }
}

extension PopUpAnimator: UIViewControllerInteractiveTransitioning {
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        guard let _ = animator(transitionContext) else { return }
        self.transitionContext = transitionContext
    }
    
    func updateInteractiveTransition(_ percentComplete: CGFloat) {
        let pa = interactiveAnimator

        pa.fractionComplete = percentComplete
        transitionContext?.updateInteractiveTransition(percentComplete)
    }

    func cancelInteractiveTransition(with velocity: CGVector = .zero) {
        guard interactive else { return }

        transitionContext?.cancelInteractiveTransition()

        interactiveAnimator.isReversed = true

        let pct = interactiveAnimator.fractionComplete
        endInteraction(from: pct, withVelocity: velocity, durationFactor: 1 - pct)
    }

    func finishInteractiveTransition(with velocity: CGVector = .zero) {
        guard interactive else { return }

        transitionContext?.finishInteractiveTransition()

        let pct = interactiveAnimator.fractionComplete
        endInteraction(from: pct, withVelocity: velocity, durationFactor: pct)
    }
    
    func endInteraction(from percentComplete: CGFloat, withVelocity velocity: CGVector, durationFactor: CGFloat) {
        switch interactiveAnimator.state {
        case .inactive:
            interactiveAnimator.startAnimation()
        default:
            interactiveAnimator.continueAnimation(withTimingParameters: nil, durationFactor: durationFactor)
        }
    }
}

extension PopUpAnimator {
    func setupAnimator(_ direction: Direction) -> UIViewPropertyAnimator {
        let damping = direction.params.damping
        let response = direction.params.response
        let timingParameters = UISpringTimingParameters(damping: damping, response: response)

        return UIViewPropertyAnimator(duration: 0, timingParameters: timingParameters)
    }
    
    func animator(_ context: UIViewControllerContextTransitioning) -> UIViewPropertyAnimator? {
        guard let from = context.viewController(forKey: .from),
              let to = context.viewController(forKey: .to),
              let fromView = from.view,
              let toView = to.view else { return nil }
        
        switch direction {
        case .presentation:
            let finalFrame = context.finalFrame(for: to)
            
            toView.frame = finalFrame.offsetBy(dx: finalFrame.width-45, dy: 0)
            let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
                toView.frame = finalFrame
            }
            
            animator.addCompletion { _ in
                context.completeTransition(!context.transitionWasCancelled)
            }
            
            return animator
        case .dismissal:
            let initialFrame = context.initialFrame(for: from)
            
            let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
                fromView.frame = initialFrame.offsetBy(dx: initialFrame.width+45, dy: 0)
            }
            
            animator.addCompletion { _ in
                context.completeTransition(!context.transitionWasCancelled)
            }
            
            return animator
        }
    }
}

extension Direction {
    var params: SpringParameters {
        switch self {
        case .presentation: return .tap
        case .dismissal: return .momentum
        }
    }
    
    struct SpringParameters {
        let damping: CGFloat
        let response: CGFloat

        static let tap = SpringParameters(damping: 1, response: 0.44)
        static let momentum = SpringParameters(damping: 0.8, response: 0.44)
    }
}

private extension UISpringTimingParameters {
    convenience init(damping: CGFloat, response: CGFloat, initialVelocity: CGVector = .zero) {
        let stiffness = pow(2 * .pi / response, 2)
        let damp = 4 * .pi * damping / response
        self.init(mass: 1, stiffness: stiffness, damping: damp, initialVelocity: initialVelocity)
    }
}
