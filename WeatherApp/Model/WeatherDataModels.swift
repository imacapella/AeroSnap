//
//  WeatherDataModels.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 22.08.2024.
//

import Foundation

struct WeatherResponse: Codable{
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
}

struct Coord : Codable{
    let lon: Double
    let lat: Double
}

struct Weather : Codable{
    let id: Int
    let main : String
    let description: String
    let icon: String
}

struct Main: Codable{
    let temp: Double
    let pressure: Int
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Codable{
    let speed: Double
    let deg: Double
}
