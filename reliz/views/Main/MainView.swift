//
//  MainView.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

class MainView: View {
    let buttonPush = Button(title: "Screen 1")
    let buttonPopUp = Button(title: "Screen 1 Pop-Up")
    
    let label: UILabel = {
        let obj = UILabel()
        obj.font = .boldSystemFont(ofSize: 24)
        obj.textColor = .text
        obj.text = "Menu"
        obj.textAlignment = .center
        return obj
    }()
    
    override func configure() {
        backgroundColor = .secondary
        addSubviews(label, buttonPush, buttonPopUp)
        
        label.constraint(leading: leadingAnchor, 36)
        label.constraint(trailing: trailingAnchor, 36)
        label.constraint(top: safeTopAnchor, 16)
        label.constraint(height: 56)
        
        buttonPush.constraint(leading: leadingAnchor, 36)
        buttonPush.constraint(trailing: trailingAnchor, 36)
        buttonPush.constraint(bottom: buttonPopUp.topAnchor, 16)
        buttonPush.constraint(height: 56)
        
        buttonPopUp.constraint(leading: leadingAnchor, 36)
        buttonPopUp.constraint(trailing: trailingAnchor, 36)
        buttonPopUp.constraint(bottom: safeBottomAnchor, 36)
        buttonPopUp.constraint(height: 56)
    }
}
