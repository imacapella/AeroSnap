//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 8.08.2024.
//

import SwiftUI

struct ContentView: View {

    @State var isNight : Bool = false
    
    var body: some View {
        ZStack {
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
                    
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

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

