//
//  NavigationBar.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

class NavigationBar: UINavigationBar {
    var clear: Bool = false
    var hide: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .purple
        if let color: UIColor = .purple {
            titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        for subview in subviews {
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground") && clear { subview.removeFromSuperview() }
            if stringFromClass.contains("BarContent") && hide { subview.isHidden = true }
        }
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


//class NavigationBar: UINavigationBar {
//    var navBar = NavigationBarView()
//    var navigationHeight: CGFloat { 100 }
//    var offset: CGFloat = 0
//    var clear: Bool = false
//    var hide: Bool = false
//    var text: String? { didSet { navBar.title(text) } }
//
//    override func sizeThatFits(_ size: CGSize) -> CGSize {
//        CGSize(width: UIScreen.main.bounds.width-offset*2, height: 100)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        for subview in subviews {
//            let stringFromClass = NSStringFromClass(subview.classForCoder)
//            if stringFromClass.contains("BarBackground") && clear { subview.removeFromSuperview() }
//            if stringFromClass.contains("BarContent") && hide { subview.isHidden = true }
//            if stringFromClass.contains("BarContent") {
//                subview.frame = CGRect(x: subview.frame.origin.x, y: 0, width: subview.frame.width, height: navigationHeight)
//            }
//        }
//
//        offset = (UIScreen.main.bounds.width - frame.width) / 2
//        navBar.frame = CGRect(x: 0, y: 0, width: frame.width, height: navigationHeight)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        translatesAutoresizingMaskIntoConstraints = false
//        addSubview(navBar)
//    }
//
//    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
//}
