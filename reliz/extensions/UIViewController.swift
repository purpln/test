//
//  UIViewController.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

extension UIViewController {
    func present(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
        present(viewController, animated: true, completion: completion)
    }
    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    func pop(_ animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    func popRoot(_ animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
}

extension UIViewController {
    private struct AssociatedKeys {
        static var PopUpTransition = "PopUpTransitionManager"
        static var PushTransition = "PushTransitionManager"
    }
    
    private(set) var popUpTransition: PopUpTransition? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.PopUpTransition) as? PopUpTransition }
        set { objc_setAssociatedObject(self, &AssociatedKeys.PopUpTransition, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    private(set) var pushTransition: PushAnimator? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.PushTransition) as? PushAnimator }
        set { objc_setAssociatedObject(self, &AssociatedKeys.PushTransition, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    func transitionPopUp(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .custom
        
        popUpTransition = PopUpTransition()
        viewController.transitioningDelegate = popUpTransition

        present(viewController, animated: true, completion: completion)
    }
    
    func transitionPush(_ viewController: UIViewController, animated: Bool = true) {
        pushTransition = PushAnimator()
        navigationController?.delegate = pushTransition
        navigationController?.pushViewController(viewController, animated: animated)
    }
    func transitionRoot(animated: Bool = true) {
        pushTransition = PushAnimator(direction: .dismissal)
        navigationController?.delegate = pushTransition
        navigationController?.popToRootViewController(animated: animated)
    }
}
