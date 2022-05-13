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
       
    }
    
    func updateWeatherIcon(condition: Int) -> String {
        switch (condition) {
        case 0...300 :
            return "tstorm1"
        case 301...500 :
            return "light_rain"
        case 501...600 :
            return "shower3"
        case 601...700 :
            return "snow4"
        case 701...771 :
            return "fog"
        case 772...799 :
            return "tstorm3"
        case 800 :
            return "sunny"
        case 801...804 :
            return "cloudy2"
        case 900...903, 905...1000  :
            return "tstorm3"
        case 903 :
            return "snow5"
        case 904 :
            return "sunny"
        default :
            return "dunno"
        }
    }

    func fillWeatherCell(_ city: String,
                             _ temp: Int,
                             _ humidity: Int,
                             _ windSpeed: Double,
                             _ picture: Int,
                             _ date: String) {
        let timeinterval : TimeInterval = (date as NSString).doubleValue
        let dateFormater : DateFormatter = DateFormatter()
            dateFormater.dateFormat = "dd MMM hh:mm"
        cityLabel.text = city
        temperatureLabel.text = "Temperature: \(temp)°C"
        humidityLabel.text = "Humidity: \(humidity) %"
        windLabel.text = "Wind: \(windSpeed) m/s"
        weatherPicture.image = UIImage(named: updateWeatherIcon(condition: picture))
        dateLabel.text = dateFormater.string(from: NSDate(timeIntervalSince1970:timeinterval) as Date)
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
