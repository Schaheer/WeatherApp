//
//  PickCountryVC.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit
import CoreLocation

class PickCountryVC: UIViewController {
    
    //MARK: - Properties
    var selectedCity: Constants.City!
    var cityTitle: String = ""

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: - Functions
    func goToWeatherVC() {
        if let vc: WeatherVC = WeatherVC.instantiateVCFromMainStoryboard() {
            vc.city = selectedCity
            vc.cityTitle = cityTitle
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: - IBActions
    @IBAction func currentLocationSelected(_ sender: Any) {
        let locationManager = WALocationManager.sharedInstance
        
        locationManager.requestLocationPermission()
        locationManager.delegate = self
        
        locationManager.requestLocation()
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

//MARK: - WDLocationManagerDelegate
extension PickCountryVC: WALocationManagerDelegate {
    
    func didReceiveUpdate(with location: CLLocation) {
        let latitude =  location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        if let vc: WeatherVC = WeatherVC.instantiateVCFromMainStoryboard() {
            vc.currentLatitude = latitude
            vc.currentLongitude = longitude
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func didChangeAuthorization(with status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
//            locationManager.requestLocation()
            break
        @unknown default:
            print("Check for more status")
        }
    }
    
}
