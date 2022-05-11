//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by Dmitriy Budanov on 11.05.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var weatherPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let timeinterval : TimeInterval = (WeatherData.shared.date.last! as NSString).doubleValue
        let dateFormater : DateFormatter = DateFormatter()
            dateFormater.dateFormat = "dd-MMM-yyyy hh:mm a"
            print(dateFormater.string(from: NSDate(timeIntervalSince1970:timeinterval) as Date))
        cityLabel.text = WeatherData.shared.city.last
        temperatureLabel.text = String(WeatherData.shared.temp.last ?? 0)
        humidityLabel.text = String(WeatherData.shared.humidity.last ?? 0)
        windLabel.text = String(WeatherData.shared.wind.last ?? 0)
        weatherPicture.image = UIImage(named: WeatherData.shared.updateWeatherIcon(condition: WeatherData.shared.condition.last ?? 0))
        dateLabel.text = dateFormater.string(from: NSDate(timeIntervalSince1970:timeinterval) as Date)
    }

   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
