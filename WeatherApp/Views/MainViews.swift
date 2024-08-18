//
//  MainViews.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 13.08.2024.
//

import SwiftUI

struct MainViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainViews()
}

/*struct showCoordinatesView: View{
    @StateObject var locationManager = LocationDataManager()
    @Binding var showCoordinatesBool: Bool
    var body: some View {
        if showCoordinatesBool{
            VStack{
                if let location = locationManager.location{
                    Text("Latitude: \(location.latitude)")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(15)
                    Text("Longitude: \(location.longitude)")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(15)
                }
            }
        }
        
    }
    
}*/

struct WeatherDayView: View {
    var dayOfWeek : String
    var temperature : Int
    var WeatherIcon : String
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: WeatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 23, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundColors: View {
    
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black :.blue, isNight ? .gray : Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct TextCityName : View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct MainWeatherStatusView : View {
    var weatherIcon : String
    var temperature : Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}
