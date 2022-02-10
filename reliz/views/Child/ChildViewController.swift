//
//  ChildViewController.swift
//  reliz
//
//  Created by Sergey Romanenko on 07.07.2021.
//

import UIKit

class ChildViewController: ViewController {
    let contentView = ChildView()
    override var NavigationBarHidden: Bool { true }
    override var NavigationBarClear: Bool { true }
    override var content: View? { contentView }
    
    var dictionary: [String:UIColor?]
    var key: String
    
    var key1: String = ""
    var key2: String = ""
    var key3: String = ""
    
    init(_ key: String, _ dict: [String:UIColor?]) {
        self.key = key
        dictionary = dict
        if let color = dict[key] {
            contentView.backgroundColor = color
        }
        contentView.navBar.title(key)
        super.init()
    }
    
    override func configure() {
        sort()
        contentView.setup(key1, key2, key3)
        contentView.navBar.delegate = self
        contentView.button1.touch(self, #selector(action1))
        contentView.button2.touch(self, #selector(action2))
        contentView.button3.touch(self, #selector(action3))
        
        //navigation?.bar?.text = key
        //navigation?.bar?.navBar.delegate = self
        //contentView.navBar.isHidden = true
    }
    
    func sort(){
        var dict = dictionary
        dict.removeValue(forKey: key)
        let array = dict.keys.sorted()
        if let key = array[safe: 0] { key1 = key }
        if let key = array[safe: 1] { key2 = key }
        if let key = array[safe: 2] { key3 = key }
    }
    
    @objc func action1() { transitionPush(ChildViewController(key1, dictionary)) }
    @objc func action2() { transitionPush(ChildViewController(key2, dictionary)) }
    @objc func action3() { transitionPush(ChildViewController(key3, dictionary)) }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension ChildViewController: NavigationBarDelegate {
    func leftAction() {
        dismiss()
        transitionRoot()
    }
}
