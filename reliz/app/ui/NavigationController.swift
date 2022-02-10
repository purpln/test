//
//  NavigationController.swift
//  reliz
//
//  Created by Sergey Romanenko on 05.07.2021.
//

import UIKit

class NavigationController: UINavigationController {
    var bar: NavigationBar? {
        guard let bar = navigationBar as? NavigationBar else { return nil }
        return bar
    }
    
    var controller: ViewController? {
        guard let controller = visibleViewController as? ViewController else { return nil }
        return controller
    }
    
    override var prefersStatusBarHidden: Bool {
        visibleViewController?.prefersStatusBarHidden ?? false
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        if let vc = viewControllers.last {
            return vc.preferredStatusBarStyle
        }
        return .default
    }

    init() {
        super.init(navigationBarClass: NavigationBar.self, toolbarClass: nil)
    }

    override init(rootViewController: UIViewController) {
        super.init(navigationBarClass: NavigationBar.self, toolbarClass: nil)
        self.viewControllers = [rootViewController]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBar.sizeToFit()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
