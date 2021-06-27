//
//  ViewController.swift
//  Weather App
//
//  Created by Vlad Vinogrotskiy on 27.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var statusView: UIImageView!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    var networkManager = NetworkManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.onComplition = { WeatherNowIs in 
        }
        networkManager.urlConfiguration(forCity: "London")
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.searchAlert(withTitle: "Find the city", message: nil, style: .alert)
            { city in self.networkManager.urlConfiguration(forCity: city)
        }
    }
    

}

extension ViewController {
    
    func searchAlert (withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            let placeholderText = "Search a city"
            textField.placeholder = placeholderText
        }
        let search = UIAlertAction(title: "Search", style: .default) { search in
            let searchTextField = alertController.textFields?.first
            guard let cityName = searchTextField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
}

