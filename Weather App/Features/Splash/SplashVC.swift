//
//  SplashVC.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vc = WeatherVC.instantiateVCFromMainStoryboard() {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

