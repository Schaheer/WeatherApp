//
//  TempWindCell.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

class TempWindCell: UITableViewCell {

    @IBOutlet weak var temperatureLAbel : UILabel!
    @IBOutlet weak var medianTemperature: UILabel!
    
    @IBOutlet weak var windSpeedLabel   : UILabel!
    @IBOutlet weak var medianWindSpeed  : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setCell(with avgTemp: String, medianTemp: String, avgWindSpeed: String, medianWind: String) {
        temperatureLAbel.text = "Avg: " + avgTemp
        medianTemperature.text = "Median: " + medianTemp
        windSpeedLabel.text = "Avg: " + avgWindSpeed
        medianWindSpeed.text = "Median: " + medianWind
    }
    
}
