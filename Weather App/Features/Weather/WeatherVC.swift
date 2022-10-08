//
//  WeatherVC.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var titleLabel   : UILabel!
    
    @IBOutlet weak var tableView    : UITableView!
    
    var city: Constants.City?
    var cityTitle: String = ""
    
    var weatherModel: WeatherModel?
    let weatherCellTypes: [Constants.WeatherCellType] = [.tempAndWind, .dayBasis]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = cityTitle
        
        if let city = city?.get() {
            let url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(city.0),\(city.1)?key=\(Constants.APIKeys.weatherAPI.rawValue)"
            
            showActivityIndicator()
            
            URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                }
                
                if let error = error {
                    print("Error with fetching data: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(response)")
                    return
                }
                
                if let data = data, let weatherModel = try? JSONDecoder().decode(WeatherModel.self, from: data) {
                    DispatchQueue.main.async {
                        self.weatherModel = weatherModel
                        
                        self.tableView.reloadData()
                    }
                }
            }.resume()
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        weatherCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch weatherCellTypes[section] {
        case .tempAndWind:
            return 1
        case .dayBasis:
            return (weatherModel?.days?.count ?? 0)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch weatherCellTypes[indexPath.section] {
        case .tempAndWind:
            if let cell: TempWindCell = tableView.dequeueReusableCell() {
                let windspeedArray: [Double] = weatherModel?.days?.map({ $0.windspeed ?? 0.0 }) ?? []
                let tempArray: [Double] = weatherModel?.days?.map({ $0.temp ?? 0.0 }) ?? []
                
                cell.setCell(with: "\(tempArray.average)", medianTemp: "\(tempArray.median)", avgWindSpeed: "\(windspeedArray.average)", medianWind: "\(windspeedArray.median)")

                return cell
            }
        case .dayBasis:
            if let cell: WeatherCell = tableView.dequeueReusableCell() {
                let day = weatherModel?.days?[indexPath.row]
                
                cell.setCell(with: "\(indexPath.row + 1)", temp: "\(day?.temp ?? 0.0)", wind: "\(day?.windspeed ?? 0.0)")

                return cell
            }
        }
        
        return UITableViewCell()
    }
    
}
