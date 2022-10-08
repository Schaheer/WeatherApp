//
//  PickCountryVC.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

class PickCountryVC: UIViewController {
    
    var selectedCity: Constants.City!
    var cityTitle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func goToWeatherVC() {
        if let vc: WeatherVC = WeatherVC.instantiateVCFromMainStoryboard() {
            vc.city = selectedCity
            vc.cityTitle = cityTitle
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func denmarkTapped(_ sender: Any) {
        selectedCity = .Copenhagen(55.676098, 12.568337)
        cityTitle = "Copenhagen"
        goToWeatherVC()
    }
    
    @IBAction func polandTapped(_ sender: Any) {
        selectedCity = .Lodz(51.759247, 19.455982)
        cityTitle = "Lodz"
        goToWeatherVC()
    }
    
    @IBAction func belgiumTapped(_ sender: Any) {
        selectedCity = .Brussels(50.850346, 4.351721)
        cityTitle = "Brussels"
        goToWeatherVC()
    }
    
    @IBAction func pakistanTapped(_ sender: Any) {
        selectedCity = .Islamabad(33.684422, 73.047882)
        cityTitle = "Islamabad"
        goToWeatherVC()
    }
    
}
