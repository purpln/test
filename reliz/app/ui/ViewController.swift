//
//  ViewController.swift
//  reliz
//
//  Created by Sergey Romanenko on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {
    var style: StatusBarStyle { .default }
    var StatusBarHidden: Bool { false }
    var NavigationBarHidden: Bool { false }
    var NavigationBarClear: Bool { false }
    var NavigationBarTitle: String { "" }
    var content: View? { nil }
    
    var navigation: NavigationController? {
        guard let navigation = navigationController as? NavigationController else { return nil }
        return navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NavigationBarTitle
        navigation?.bar?.clear = NavigationBarClear
        if let view = content {
            self.view = view
            view.configure()
        }
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if NavigationBarHidden {
            navigationController?.setNavigationBarHidden(true, animated: true)
            navigation?.bar?.hide = NavigationBarHidden
        }
        super.viewWillAppear(animated)
        willAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if NavigationBarHidden {
            navigationController?.setNavigationBarHidden(false, animated: true)
            navigation?.bar?.hide = NavigationBarHidden
        }
        super.viewWillDisappear(animated)
        willDisappear()
    }
    
    func configure() { }
    func willAppear() { }
    func willDisappear() { }
    
    override var prefersStatusBarHidden: Bool { StatusBarHidden }
    override var preferredStatusBarStyle: UIStatusBarStyle { style.style }
    
    init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

enum StatusBarStyle {
    case `default`, light, dark
    
    var style: UIStatusBarStyle {
        switch self {
        case .default: return .default
        case .light: return .lightContent
        case .dark: if #available(iOS 13.0, *) { return .darkContent } else { return .lightContent }
        }
    }
}
