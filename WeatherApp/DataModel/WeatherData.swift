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
