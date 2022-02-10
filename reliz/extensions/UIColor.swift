//
//  UIColor.swift
//  reliz
//
//  Created by Sergey Romanenko on 06.07.2021.
//

import UIKit

extension UIColor {
    convenience init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: (r, g, b, a) = ((int >> 8) * 17, (int >> 4 & 0xf) * 17, (int & 0xf) * 17, 0xff)
        case 4: (r, g, b, a) = (int >> 12, int >> 8 & 0xff, int >> 4 & 0xff, int & 0xff)
        case 6: (r, g, b, a) = (int >> 16, int >> 8 & 0xff, int & 0xff, 0xff)
        case 8: (r, g, b, a) = (int >> 24 & 0xff, int >> 16 & 0xff, int >> 8 & 0xff, int & 0xff)
        default:(r, g, b, a) = (1, 1, 1, 1)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue:  CGFloat(b) / 255, alpha: CGFloat(a) / 255 )
        return
    }
    
    static var primary: UIColor? { .init(hex: "ffffff") }
    static var secondary: UIColor? { .init(hex: "f2f3fD") }
    static var button: UIColor? { .init(hex: "8d99f0") }
    static var text: UIColor? { .init(hex: "031e64") }
    static var purple: UIColor? { .init(hex: "d6dcfc") }
    static var green: UIColor? { .init(hex: "d4f1d9") }
    static var yellow: UIColor? { .init(hex: "fdf3c7") }
    static var pink: UIColor? { .init(hex: "d4b2f1") }
}
