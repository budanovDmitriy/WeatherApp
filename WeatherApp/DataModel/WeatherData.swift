//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Dmitriy Budanov on 11.05.2022.
//

import UIKit

class WeatherData {
    
    public static var shared = WeatherData()
    
    private init() { }
    
    var city: [String] {
        get {
            guard let cities = UserDefaults.standard.array(forKey: UDKeys.city.rawValue) as? [String] else {
                return []
            }
            return cities
        }
        set (newCity) {
            UserDefaults.standard.set(newCity, forKey: UDKeys.city.rawValue)
        }
    }
    
    var wind: [Double] {
        get {
            guard let winds = UserDefaults.standard.array(forKey: UDKeys.wind.rawValue) as? [Double] else {
                return []
            }
            return winds
        }
        set (newWind) {
            UserDefaults.standard.set(newWind, forKey: UDKeys.wind.rawValue)
        }
    }
    
    var humidity: [Int] {
        get {
            guard let humidities = UserDefaults.standard.array(forKey: UDKeys.humidity.rawValue) as? [Int] else {
                return []
            }
            return humidities
        }
        set (newHumidity) {
            UserDefaults.standard.set(newHumidity, forKey: UDKeys.humidity.rawValue)
        }
    }
    
    var date: [String] {
        get {
            guard let date = UserDefaults.standard.array(forKey: UDKeys.date.rawValue) as? [String] else {
                return []
            }
            return date
        }
        set (newDate) {
            UserDefaults.standard.set(newDate, forKey: UDKeys.date.rawValue)
        }
    }
    
    var temp: [Int] {
        get {
            guard let temperature = UserDefaults.standard.array(forKey: UDKeys.temp.rawValue) as? [Int] else {
                return []
            }
            return temperature
        }
        set (newTemp) {
            UserDefaults.standard.set(newTemp, forKey: UDKeys.temp.rawValue)
        }
    }
    
    var condition: [Int] {
        get {
            guard let condition = UserDefaults.standard.array(forKey: UDKeys.condition.rawValue) as? [Int] else {
                return []
            }
            return condition
        }
        set (newCondition) {
            UserDefaults.standard.set(newCondition, forKey: UDKeys.condition.rawValue)
        }
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
    
    private enum UDKeys: String {
        case city
        case wind
        case humidity
        case date
        case temp
        case condition
        case weatherIconName
    }
}
