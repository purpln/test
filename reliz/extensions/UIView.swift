//
//  UIView.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) { return safeAreaLayoutGuide.topAnchor }
        return topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return safeAreaLayoutGuide.leftAnchor }
        return leftAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){ return safeAreaLayoutGuide.rightAnchor }
        return rightAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) { return safeAreaLayoutGuide.bottomAnchor }
        return bottomAnchor
    }
}


