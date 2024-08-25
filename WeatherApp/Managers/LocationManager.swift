import Foundation
import CoreLocation

class LocationDataManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var isLocationSharedSuccesfully: Bool = false
    @Published var district: String?
    @Published var city: String?
    @Published var coordinates: CLLocationCoordinate2D?  // Enlem ve boylamı saklamak için
    private let geocoder = CLGeocoder()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocationAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            isLocationSharedSuccesfully = true
            authorizationStatus = .authorizedWhenInUse
            manager.requestLocation()  // Konum talebi
            break
            
        case .restricted:
            authorizationStatus = .restricted
            break
            
        case .denied:
            authorizationStatus = .denied
            break
            
        case .notDetermined:
            authorizationStatus = .notDetermined
            break
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }  
        print("locationManager: ", location)
        
        self.coordinates = location.coordinate
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        self.geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self else { return }
            if let error = error {
                print("Reverse geocoding failed with error: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("No placemark found.")
                return
            }
            
            DispatchQueue.main.async {
                self.district = placemark.locality
                self.city = placemark.administrativeArea
            }
        }
    }

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
    func reverseGeocode(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
           let location = CLLocation(latitude: latitude, longitude: longitude)
        print("reverseGeocode: ",location)
           
           
       }
}
