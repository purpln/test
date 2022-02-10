//
//  ChildView.swift
//  reliz
//
//  Created by Sergey Romanenko on 07.07.2021.
//

import UIKit

class ChildView: View {
    var navBar = NavigationBarView()
    var button1 = Button()
    var button2 = Button()
    var button3 = Button()
    
    func setup(_ title1: String?, _ title2: String?, _ title3: String?) {
        button1.set(title1)
        button2.set(title2)
        button3.set(title3)
    }
    
    override func configure() {
        addSubviews(navBar, button1, button2, button3)
        
        navBar.constraint(top: safeTopAnchor)
        navBar.constraint(leading: leadingAnchor)
        navBar.constraint(trailing: trailingAnchor)
        navBar.constraint(height: 100)
        
        button1.constraint(leading: leadingAnchor, 36)
        button1.constraint(trailing: trailingAnchor, 36)
        button1.constraint(bottom: button2.topAnchor, 16)
        button1.constraint(height: 56)
        
        button2.constraint(leading: leadingAnchor, 36)
        button2.constraint(trailing: trailingAnchor, 36)
        button2.constraint(bottom: button3.topAnchor, 16)
        button2.constraint(height: 56)
        
        button3.constraint(leading: leadingAnchor, 36)
        button3.constraint(trailing: trailingAnchor, 36)
        button3.constraint(bottom: safeBottomAnchor, 36)
        button3.constraint(height: 56)
    }
}
