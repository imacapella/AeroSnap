import SwiftUI
import CoreLocation

struct WelcomePage: View {
    @ObservedObject var locationManager: LocationManager
    
    @State private var proceedToApp = false
    
    var body: some View {
        if proceedToApp == true {
            WeathersView()}
        else{
            
            VStack {
                Text("Welcome to")
                    .font(.title)
                Text("AeroForecast")
                    .font(.title)
                    .bold()
                
                Button(action: {
                    locationManager.checkLocalAuthorization()
                    proceedToApp = true
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
        }
    }
}

#Preview {
    WelcomePage(locationManager: LocationManager())
}
