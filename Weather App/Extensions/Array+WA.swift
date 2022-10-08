//
//  Array+WA.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import Foundation

extension Array where Element: BinaryFloatingPoint {

    /// The average value of all the items in the array
    var average: Double {
        if self.isEmpty {
            return 0.0
        } else {
            let sum = self.reduce(0, +)
            return (Double(sum) / Double(self.count)).rounded(toPlaces: 2)
        }
    }
    
    /// The median value of all the items in the array
    var median: Double {
        let sortedArray = sorted()
        if count % 2 != 0 {
            return Double(sortedArray[safe: count / 2] ?? 0)
        } else {
            return Double((sortedArray[safe: count / 2] ?? 0) + (sortedArray[safe: count / 2 - 1] ?? 0)) / 2.0
        }
    }

}
