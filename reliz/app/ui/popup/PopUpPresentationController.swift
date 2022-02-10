//
//  PopUpPresentationController.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

class PopUpPresentationController: UIPresentationController {
    override var shouldPresentInFullscreen: Bool { false }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let bounds = containerView!.bounds
        let height = bounds.height - 180
        let width = bounds.width - 90
        return CGRect(x: 45, y: 90, width: width, height: height)
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        configure()
        performAlongsideTransitionIfPossible { [unowned self] in
            self.handleView.alpha = 1
        }
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        guard let containerView = containerView else { return }
        presentedView?.frame = frameOfPresentedViewInContainerView
        handleView.frame = containerView.frame
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        performAlongsideTransitionIfPossible { [unowned self] in
            self.handleView.alpha = 0
        }
    }
    
    func configure() {
        guard let containerView = containerView, let presentedView = presentedView else { return }
        presentedView.layer.cornerRadius = 20
        containerView.addSubview(presentedView)
        containerView.insertSubview(handleView, at: 0)
    }
    
    private func performAlongsideTransitionIfPossible(_ block: @escaping () -> Void) {
        guard let coordinator = self.presentedViewController.transitionCoordinator else {
            block()
            return
        }
            
        coordinator.animate(alongsideTransition: { _ in
            block()
        }, completion: nil)
    }
    
    private lazy var handleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.purple?.withAlphaComponent(0.5)
        view.alpha = 0
        return view
    }()
}
