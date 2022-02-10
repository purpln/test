//
//  Button.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

class Button: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    convenience init(title: String?) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 28
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .button
        titleLabel?.font = .boldSystemFont(ofSize: 20)
    }
    
    func touch(_ target: Any?, _ selector: Selector) {
        addTarget(target, action: selector, for: .touchUpInside)
    }
    
    func set(_ title: String?) {
        setTitle(title, for: .normal)
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) { self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) }
        super.touchesBegan(touches, with: event)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) { self.transform = CGAffineTransform.identity }
        super.touchesEnded(touches, with: event)
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) { self.transform = CGAffineTransform.identity }
        super.touchesCancelled(touches, with: event)
    }
}
