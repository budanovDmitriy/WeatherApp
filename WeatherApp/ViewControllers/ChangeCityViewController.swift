//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Dmitriy Budanov on 10.05.2022.
//

import UIKit

protocol ChangeCityDelegate {
    func userEnterCityName(city: String)
}

class ChangeCityViewController: UIViewController {

    var delegate: ChangeCityDelegate?
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getWeatherTapped(_ sender: Any) {
        
        guard let cityName = cityTextField.text else {
            return
        }
        
        delegate?.userEnterCityName(city: cityName)
        self.dismiss(animated: true, completion: nil)
    }
}
