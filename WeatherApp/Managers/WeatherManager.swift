//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 22.08.2024.
//

import Foundation
import CoreLocation


class WeatherManager {
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (WeatherResponse?) -> Void) {
        let apiKey = "YOUR_API_KEY"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else {
            print("Invalid API URL")
            completion(nil)
            return
        }

        // URLSession data task
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherResponse)
                }
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}


