//
//  Collection+WA.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import Foundation

extension Collection {

    /*
     [1, 2, 3][safe: 4] // Array - prints 'nil'
     (0..<3)[safe: 4] // Range - prints 'nil'
     */
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}
