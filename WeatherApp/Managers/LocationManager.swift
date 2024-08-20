import Foundation
import CoreLocation

class LocationDataManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var isLocationSharedSuccesfully: Bool = false
    
    override init() {
        super.init()
        locationManager.delegate = self// Delegasyonu sadece butona basıldığında ayarlayın
    }
    
    func requestLocationAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  // Konum servisleri erişilebilir.
            isLocationSharedSuccesfully = true
            authorizationStatus = .authorizedWhenInUse
            manager.requestLocation() // Konum talebi
            break
            
        case .restricted:  // Konum servisleri mevcut değil.
            authorizationStatus = .restricted
            break
            
        case .denied:  // Konum servisleri mevcut değil.
            authorizationStatus = .denied
            break
            
        case .notDetermined:  // Yetki henüz belirlenmemiş.
            authorizationStatus = .notDetermined
            break
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Konum güncellemeleriyle ilgili kodu buraya ekleyin
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
}
