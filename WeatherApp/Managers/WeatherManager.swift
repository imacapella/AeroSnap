//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 22.08.2024.
//

import Foundation
import CoreLocation

class WeatherManager: ObservableObject {
    private var locationManager: LocationDataManager
    
    init(locationManager: LocationDataManager) {
        self.locationManager = locationManager
        // Koordinatlar mevcutsa reverseGeocode çağır

    }
    
    func fetchWeather() {
       
    }
}

