//
//  Constants.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import Foundation

class Constants {
    
    enum APIKeys: String {
        case weatherAPI       = "9A4M7M3P4PBKH4GJGRT38GAXL"
    }
    
}

//MARK: - Enums
extension Constants {
 
    enum City {
        case Copenhagen(Double, Double)
        case Lodz(Double, Double)
        case Brussels(Double, Double)
        case Islamabad(Double, Double)
        
        func get() -> (Double, Double) {
            switch self {
            case .Copenhagen(let lat, let long):
                return (lat, long)
            case .Lodz(let lat, let long):
                return (lat, long)
            case .Brussels(let lat, let long):
                return (lat, long)
            case .Islamabad(let lat, let long):
                return (lat, long)
            }
        }
    }
    
    enum WeatherCellType {
        case tempAndWind
        case dayBasis
    }
    
}
