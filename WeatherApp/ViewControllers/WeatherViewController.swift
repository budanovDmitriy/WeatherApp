//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dmitriy Budanov on 10.05.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather"
    let apiId = "f511d11fc5aae90238f9686fd3f65ebf"
   
    @IBOutlet var tableView: UITableView!
    
    let loactionManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        loactionManager.delegate = self
        loactionManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        loactionManager.requestAlwaysAuthorization()
        loactionManager.startUpdatingLocation()
    }
    
    //MARK: - CLLocationManager
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        
        if location.horizontalAccuracy > 0 {
            loactionManager.stopUpdatingLocation()
            print("long: \(location.coordinate.longitude), lat: \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params: [String:String] = ["lat": latitude , "lon": longitude , "appid": apiId]
            
            getWeatherData(url: apiUrl, params: params)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("err: ", error)
        //update
    }
    
    
    func getWeatherData(url: String, params: [String: String]) {
        
        AF.request(url, method: .get, parameters: params).responseJSON { (response) in
            if response.value != nil {
                let weatherJSON: JSON = JSON(response.value!)
                print("weatherJSON: ", weatherJSON)
                //update
                self.updateWeatherData(json: weatherJSON)
            } else {
                print("err, \(String(describing: response.error))")
            }
        }
    }

    
    func updateWeatherData(json: JSON){
        
        if let tempResult = json["main"]["temp"].double {
            WeatherData.shared.city.append(json["name"].stringValue)
            WeatherData.shared.temp.append(Int(tempResult - 273.15))
            WeatherData.shared.wind.append(json["wind"]["speed"].double ?? 0)
            WeatherData.shared.humidity.append(json["main"]["humidity"].intValue)
            WeatherData.shared.date.append(json["dt"].stringValue)
            WeatherData.shared.condition.append(json["weather"][0]["id"].intValue)
            
        } else {
            
        }
        
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "city" {
            let vc = segue.destination as! ChangeCityViewController
            vc.delegate = self
        }
    }
    
    
    func userEnterCityName(city: String) {
        print(city)
        let params: [String:String] = ["q": city , "appid": apiId]
        getWeatherData(url: apiUrl, params: params)
        self.tableView.reloadData()
    }
}

extension WeatherViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textFieldCell = UINib(nibName: "CustomTableViewCell",
                                  bundle: nil)
        self.tableView.register(textFieldCell,
                                forCellReuseIdentifier: "CustomTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        return cell
    }
}


