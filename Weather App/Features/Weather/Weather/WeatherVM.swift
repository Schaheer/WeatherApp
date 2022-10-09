//
//  WeatherVM.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import Foundation

class WeatherVM {
    
    func fetchWeatherData(with latitude: Double, longitude: Double, completion: @escaping(Result<WeatherModel?, Error>) -> Void) {
        WeatherService.fetchWeatherData(with: latitude, longitude: longitude, completion: completion)
    }
    
}
