import SwiftUI
import CoreLocation

struct WelcomePage: View {
    @ObservedObject var locationManager: LocationManager
    
    @State private var proceedToApp = false
    
    var body: some View {
        if proceedToApp {
            WeathersView()
        } else {
            VStack {
                Text("Welcome to")
                    .font(.title)
                Text("AeroForecast")
                    .font(.title)
                    .bold()
                
                Button(action: {
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
                .padding()
            }
            .onAppear {
                locationManager.checkLocalAuthorization()
            }
        }
    }
    
}

#Preview {
    WelcomePage(locationManager: LocationManager())
}
