//
//  Network Manager.swift
//  Weather App
//
//  Created by Vlad Vinogrotskiy on 27.06.2021.
//

import Foundation

let apiKey = "e41e6c84b04bb1012497ff89481bd60a"

struct NetworkManager {
    var onComplition: ((WeatherNowIs) -> Void)?
    
    func urlConfiguration (forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print (error)
                return
            }
            if let response = response {
                print (response)
                return
            }
            if let data = data {
                if let weatherNowIs = parseJSON(withData: data){
                    self.onComplition?(weatherNowIs)
                }
            }
            
        }.resume()
    }
    
    func parseJSON (withData data: Data) -> WeatherNowIs? {
        do {
            let weatherNowIsData = try JSONDecoder().decode(WeatherNowIsData.self, from: data )
            guard let weatherNowIs = WeatherNowIs(weatherNowIsData: weatherNowIsData) else { return nil }
            return weatherNowIs
            
        } catch let error as NSError {
            print(error.localizedDescription )
        }
        return nil
    }
}
