import SwiftUI
import CoreLocationUI

struct WelcomePage: View {
    @ObservedObject var locationDataManager: LocationDataManager
    
    var body: some View {
       
            VStack {
                Text("Welcome to")
                    .font(.title)
                Text("AeroForecast")
                    .font(.title)
                    .bold()
                
                LocationButton(.shareCurrentLocation){
                    locationDataManager.locationManager.requestWhenInUseAuthorization()
                    print(locationDataManager.locationManager.authorizationStatus)
                }
                .cornerRadius(25)
                .foregroundColor(.white)
                .symbolVariant(.fill)
            }
            
            
            /*Button(action: {
             if locationManager.manager.authorizationStatus == .notDetermined || locationManager.manager.authorizationStatus == .denied{
             locationManager.manager.requestWhenInUseAuthorization()
             }
             else{
             if locationManager.manager.authorizationStatus == .authorizedAlways || locationManager.manager.authorizationStatus == .authorizedWhenInUse{
             proceedToApp = true
             }
             }
             }) {
             Text("Proceed to App")
             .font(.headline)
             .frame(width: 250, height: 50)
             .background(Color.blue)
             .foregroundColor(.white)
             .cornerRadius(10)
             }
             .padding()*/
        }
        
    }

#Preview {
    WelcomePage(locationDataManager: LocationDataManager())
}
