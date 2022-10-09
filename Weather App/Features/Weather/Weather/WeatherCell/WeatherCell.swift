//
//  WeatherCell.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setCell(with day: String, temp: String, wind: String) {
        dayLabel.text = "🗓 " + day
        tempLabel.text = "🌡 " + temp
        windSpeedLabel.text = "🍃 " + wind
    }
    
}
