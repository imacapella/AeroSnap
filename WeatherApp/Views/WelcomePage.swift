import SwiftUI
import CoreLocationUI

struct WelcomePage: View {
    @ObservedObject var locationDataManager: LocationDataManager = LocationDataManager()
    @State var willNavigate : Bool = false
    var body: some View {
        if willNavigate{
            WeathersView()
        }
        else{
            VStack {
                TextWelcomeToApp()
                    .padding()
                Spacer()
                TextAppFeatures()
                    .padding(.bottom)
                ShareCurrentLocationButton(willNavigate: $willNavigate)
                    .padding(.top)
                Spacer()
                
            }
        }
    }
}


#Preview {
    WelcomePage(willNavigate: false)
        .preferredColorScheme(.dark)
}



struct TextWelcomeToApp : View {
    var body: some View {
        VStack{
            Text("Welcome to")
                .font(.largeTitle)
            Text("AeroForecast")
                .font(.system(size: 50, weight: .bold, design: .default))
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.softPurple, Color.lightBlue]),
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                )
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
                            LinearGradient(gradient: Gradient(colors: [.softPurple, .lightBlue])
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
    @ObservedObject var locationDataManager: LocationDataManager = LocationDataManager()
    @Binding var willNavigate: Bool
    
    var body: some View {
        GradientButton(text: "Share Current Location", icon: "location.fill", gradientColor1: .softPurple, gradientColor2: .lightBlue, btnWidth: 250, btnHeight: 40) {
            locationDataManager.locationManager.requestWhenInUseAuthorization()
            if locationDataManager.locationManager.authorizationStatus == .authorizedWhenInUse {
                
            }
        }
            
              /*GradientButton(text: "Start The App", icon: "play.fill", gradientColor1: .softPurple, gradientColor2: .lightBlue, btnWidth: 250, btnHeight: 40) {
                    print("Go to next page")
            }*/
        }
}


