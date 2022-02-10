//
//  Array.swift
//  reliz
//
//  Created by Sergey Romanenko on 07.07.2021.
//

import Foundation

extension Array {
    /* get safe Element from Array */
    /* usage: array[safe: 0] */
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
