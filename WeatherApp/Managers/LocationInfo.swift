//
//  LocationInfo.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 13.08.2024.
//

import Foundation
import CoreLocation

class LocationInfo {
    private var districtName = ""
    private var cityName = ""
    
    func getDistrictAndProvinceLocation(latitude: Double, longitude: Double, completion: @escaping (String?, String?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemarks, _ in
            guard let placemark = placemarks?.first else { completion(nil, nil); return }
            self.districtName = placemark.subLocality ?? ""
            self.cityName = placemark.administrativeArea ?? ""
            completion(self.districtName, self.cityName)
        }
    }
    
    func getNameDistrict() -> String { districtName }
    
    func getNameProvince() -> String { cityName }
}

