//
//  NavigationBarView.swift
//  reliz
//
//  Created by Sergey Romanenko on 07.07.2021.
//

import UIKit

@objc protocol NavigationBarDelegate: AnyObject {
    @objc optional func leftAction()
    @objc optional func rightAction()
}

class NavigationBarView: View {
    var delegate: NavigationBarDelegate?
    
    let label: UILabel = {
        let obj = UILabel()
        obj.font = .boldSystemFont(ofSize: 28)
        obj.textColor = .text
        obj.textAlignment = .center
        return obj
    }()
    
    let leftButton: UIButton = {
        let obj = UIButton()
        obj.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        obj.setImage(.back, for: .normal)
        obj.tintColor = .text
        return obj
    }()
    
    let rightButton: UIButton = {
        let obj = UIButton()
        obj.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        obj.setImage(.next, for: .normal)
        obj.tintColor = .text
        return obj
    }()
    
    override func initialize() {
        addSubviews(leftButton, rightButton, label)
        rightButton.isHidden = true
        
        leftButton.constraint(top: topAnchor)
        leftButton.constraint(leading: leadingAnchor)
        leftButton.constraint(bottom: bottomAnchor)
        leftButton.constraint(width: 80)
        
        rightButton.constraint(top: topAnchor)
        rightButton.constraint(trailing: trailingAnchor)
        rightButton.constraint(bottom: bottomAnchor)
        rightButton.constraint(width: 80)
        
        label.constraint(top: topAnchor)
        label.constraint(bottom: bottomAnchor)
        label.constraint(trailing: rightButton.leadingAnchor)
        label.constraint(leading: leftButton.trailingAnchor)
    }
    
    func title(_ string: String?) {
        label.text = string
    }
    
    @objc func leftAction() {
        delegate?.leftAction?()
    }
    
    @objc func rightAction() {
        delegate?.rightAction?()
    }
}
