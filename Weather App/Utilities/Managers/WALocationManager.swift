//
//  WALocationManager.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import CoreLocation

protocol WALocationManagerDelegate: AnyObject {
    func didReceiveUpdate(with location: CLLocation)
    func didChangeAuthorization(with status: CLAuthorizationStatus)
}

class WALocationManager: NSObject {
    
    static var sharedInstance = WALocationManager()
    
    weak var delegate: WALocationManagerDelegate?
    
    var locationManager: CLLocationManager!
    
    override init() {
        locationManager = CLLocationManager()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .other
        
        super.init()
        
        locationManager.delegate = self
    }
    
    func requestLocationPermission() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func requestLocation() {
        locationManager.startUpdatingLocation()
    }
    
}

extension WALocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            print(latitude, longitude)
            
            manager.stopUpdatingLocation()
            
            delegate?.didReceiveUpdate(with: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if #available(iOS 14.0, *) {
            delegate?.didChangeAuthorization(with: manager.authorizationStatus)
        } else {
            delegate?.didChangeAuthorization(with: CLLocationManager.authorizationStatus())
        }
    }
    
}
