//
//  WeatherVC.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

class WeatherVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel   : UILabel!
    
    @IBOutlet weak var tableView    : UITableView!
    
    //MARK: - Properties
    let viewModel = WeatherVM()
    
    var city: Constants.City?
    var cityTitle: String = ""
    
    var currentLatitude: Double?
    var currentLongitude: Double?
    
    var weatherModel: WeatherModel?
    let weatherCellTypes: [Constants.WeatherCellType] = [.tempAndWind, .dayBasis]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = cityTitle
        
        if let city = city?.get() {
            fetchWeatherData(latitude: city.0, longitude: city.1)
        } else if let currentLatitude = currentLatitude, let currentLongitude = currentLongitude { //Current location flow
            fetchWeatherData(latitude: currentLatitude, longitude: currentLongitude)
        }
    }
    
    //MARK: - Functions
    func fetchWeatherData(latitude: Double, longitude: Double) {
        showActivityIndicator()
        
        viewModel.fetchWeatherData(with: latitude, longitude: longitude, completion: { [weak self] result in
            self?.hideActivityIndicator()
            
            switch result {
            case .success(let weatherModel):
                self?.weatherModel = weatherModel
                
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
    }
    
    //MARK: - IBActions
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - UITableViewDelegate & UITableViewDataSource
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
