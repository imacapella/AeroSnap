//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 8.08.2024.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var locationDataManager = LocationDataManager()
    var body: some View {
        VStack {
            if locationDataManager.isLocationSharedSuccesfully {
                WeathersView()
                okayorNot()
            }
            else{
                WelcomePage(locationManager: LocationDataManager())
                    .preferredColorScheme(.dark)
                okayorNot()
            }
        }
    }
}

struct okayorNot : View {
    @StateObject var locationDataManager = LocationDataManager()
    var body: some View {
        if locationDataManager.isLocationSharedSuccesfully {
            Image(systemName: "plus.app.fill")
        }
        else{
            Image(systemName: "xmark.app.fill")
        }
    }
}


#Preview {
    ContentView()
}

/*
ZStack{
        VStack{
        if let location = locationManager.location {
            Text("Latitude: \(location.latitude)")
            Text("Longitude: \(location.longitude)")
            
            Button("Get Location Info") {
                locationInfo.getCityAndCountryLocation(latitude: location.latitude, longitude: location.longitude) { city, country in
                    self.cityName = city ?? "Unknown"
                    self.countryName = country ?? "Unknown"
                }
            }
            Text("Current City: \(cityName)")
        } else {
            Text("Location is not available")
        }
    }
}
.onAppear(){
    print("now checking...")
    locationManager.checkLocalAuthorization()
}
*/

/* THIS CODES ARE FORMERLY USED BUT NOT NECESSEARY FOR NOW. JUST IN CASE ^^
BackgroundColors(isNight: $isNight)
VStack {
    TextCityName(cityName: "Cupertino, CA")
    MainWeatherStatusView(weatherIcon: "cloud.sun.fill", temperature: 76)
    Spacer()
    HStack(spacing: 30){
        WeatherDayView(dayOfWeek: "TUE", temperature: 76, WeatherIcon: "cloud.sun.fill")
        WeatherDayView(dayOfWeek: "WED", temperature: 55, WeatherIcon: "wind")
        WeatherDayView(dayOfWeek: "THU", temperature: 80, WeatherIcon: "sun.max.fill")
        WeatherDayView(dayOfWeek: "FRI", temperature: 50, WeatherIcon: "cloud.drizzle.fill")
        WeatherDayView(dayOfWeek: "SAT", temperature: 40, WeatherIcon: "snowflake")
    }
    Spacer()
    Button{isNight.toggle()}
    label:{
        Text("Change Day Time")
            .frame(width: 280, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
    }
*/
