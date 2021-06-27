//
//  WeatherNowIsUnits.swift
//  Weather App
//
//  Created by Vlad Vinogrotskiy on 27.06.2021.
//

import Foundation

struct WeatherNowIs {
    let cityName: String
    let conditionCode: Int
    let temperature: Double
    let feelsLikeTemperature: Double
    
    var temperatureString: String {
        "\(temperature.rounded())"
    }
    var feelsLikeTempString: String {
        "\(feelsLikeTemperature.rounded())"
    }
    
    init?(weatherNowIsData: WeatherNowIsData) {
        cityName = weatherNowIsData.name
        temperature = weatherNowIsData.main.temp
        feelsLikeTemperature = weatherNowIsData.main.feelsLike
        conditionCode = weatherNowIsData.weather.first!.id
    }
    
}
