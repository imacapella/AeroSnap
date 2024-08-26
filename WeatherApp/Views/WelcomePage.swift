import SwiftUI
import CoreLocation

struct WelcomePage: View {
    @State var locationManager : LocationDataManager
    
    
    var body: some View {
        VStack {
            TextWelcomeToApp()
                .padding()
            Spacer()
            TextAppFeatures()
                .padding(.bottom)
            ShareCurrentLocationButton(locationDataManager: locationManager)
                .padding(.top)
            Spacer()
        }
    }
}





#Preview {
    WelcomePage(locationManager: LocationDataManager())
        .preferredColorScheme(.dark)
}



struct TextWelcomeToApp : View {
    var body: some View {
        VStack{
            Text("Welcome to")
                .font(.largeTitle)
            ZStack {
                Text("AeroSnap")
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .blur(radius: 15)
                    .shadow(color: Color.softBlue.opacity(0.01), radius: 10, x: 0, y: 0)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.softBlue, Color.lightBlue]),
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        )
                    )
                Text("AeroSnap")
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.softBlue, Color.lightBlue]),
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        )
                    )
            }
            
        }
    }
}

struct TextAppFeatures : View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            ForEach(1...3, id: \.self){index in
                HStack(alignment: .center, spacing: 15){
                    Text("\(index).")
                        .font(.system(size: 35, weight: .bold, design: .default))
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.softBlue, .lightBlue])
                                           ,startPoint: .bottomLeading, endPoint: .topTrailing))
                        .multilineTextAlignment(.leading)
                    
                    Text(index == 1 ? "Share your current location" : (index == 2) ? "Get accurate weather updates" : "Monitor temperature trends")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        
                }
                //.padding()
                .frame(width: 350, height: 80)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .shadow(radius: 2)
            }
        }.padding()
    }
}

struct ShareCurrentLocationButton: View {
    @ObservedObject var locationDataManager: LocationDataManager
    
    var body: some View {
        ZStack {
            GradientButton(text: "Share Current Location", icon: "location.fill", gradientColor1: .softBlue, gradientColor2: .lightBlue, btnWidth: 250, btnHeight: 40) {
                print("blabla")
            }
            .blur(radius: 5)
            .shadow(color: Color.softBlue.opacity(0.01), radius: 10, x: 0, y: 0)
            GradientButton(text: "Share Current Location", icon: "location.fill", gradientColor1: .softBlue, gradientColor2: .lightBlue, btnWidth: 250, btnHeight: 40) {
                locationDataManager.requestLocationAuthorization()
                if locationDataManager.authorizationStatus == .authorizedWhenInUse {
                    // Konum izni başarılı
                    print(locationDataManager.authorizationStatus ?? .notDetermined)
                }
            }
        }
    }
}



