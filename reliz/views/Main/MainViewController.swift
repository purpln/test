//
//  MenuViewController.swift
//  reliz
//
//  Created by Sergey Romanenko on 05.07.2021.
//

import UIKit

class MainViewController: ViewController {
    let contentView = MainView()
    let controllers: [String: UIColor?] = ["Screen 1":.purple, "Screen 2":.pink,
                                          "Screen 3":.green, "Screen 4":.yellow]
    let controller: String = "Screen 1"
    override var NavigationBarHidden: Bool { true }
    override var content: View? { contentView }
    
    override func configure() {
        view.backgroundColor = .primary
        contentView.buttonPush.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        contentView.buttonPopUp.addTarget(self, action: #selector(popUpAction), for: .touchUpInside)
    }
    
    @objc func pushAction() {
        let controller = ChildViewController(controller, controllers)
        transitionPush(controller)
    }
    
    @objc func popUpAction() {
        let controller = ChildViewController(controller, controllers)
        transitionPopUp(NavigationController(rootViewController: controller))
    }
}
