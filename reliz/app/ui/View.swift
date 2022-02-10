//
//  View.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func configure() { }
    func initialize() { }
    func layout() { }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
