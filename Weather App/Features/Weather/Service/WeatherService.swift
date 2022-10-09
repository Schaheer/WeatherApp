//
//  WeatherService.swift
//  Weather App
//
//  Created by Schaheer Saleem on 09/10/2022.
//

import Foundation

class WeatherService {
    
    class func fetchWeatherData(with latitude: Double, longitude: Double, completion: @escaping(Result<WeatherModel?, Error>) -> Void) {
        let url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(latitude),\(longitude)?key=\(Constants.APIKeys.weatherAPI.rawValue)"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            if let error = error {
                print("Error with fetching data: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            if let data = data, let weatherModel = try? JSONDecoder().decode(WeatherModel.self, from: data) {
                DispatchQueue.main.async {
                    completion(.success(weatherModel))
                }
            }
        }.resume()
    }
    
}
