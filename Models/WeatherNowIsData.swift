//
//  Weather Now Is.swift
//  Weather App
//
//  Created by Vlad Vinogrotskiy on 27.06.2021.
//


//   let weatherNowIs = try? newJSONDecoder().decode(WeatherNowIs.self, from: jsonData)

import Foundation

// MARK: - WeatherNowIs
struct WeatherNowIsData: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
}

