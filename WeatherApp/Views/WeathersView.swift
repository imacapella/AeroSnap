//
//  WeathersView.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 14.08.2024.
//

import SwiftUI

struct WeathersView: View {
    @State var locationManager: LocationDataManager
    @State var weather: WeatherResponse?
    var weatherManager: WeatherManager
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.softBlue, .lightBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(alignment: .leading) {
                Spacer()
                CityCountryText(locationManager: LocationDataManager())
                    .frame(alignment: .leading)
                
                if let weather = weather {
                    CurrentWeatherInfoBlock(weather: weather)
                        .padding()
                    Spacer()
                    MoreWeatherInfoBlocks(weather: weather)
                } else {
                    ProgressView()
                }
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            fetchWeather()
        }
    }
    
    func fetchWeather() {
        weatherManager.fetchWeather(latitude: locationManager.locationManager.location?.coordinate.latitude ?? 0, longitude: locationManager.locationManager.location?.coordinate.longitude ?? 0) { response in
            DispatchQueue.main.async {
                self.weather = response
            }
        }
    }
}


#Preview {
    WeathersView(locationManager: LocationDataManager(), weatherManager: WeatherManager())
}

struct CurrentWeatherInfoBlock: View {
    var weather: WeatherResponse
    var iconCode: String {
            weather.weather.first?.icon ?? "default_icon" // Default icon if not available
        }
    
    var body: some View {
        HStack(spacing: 10) {
            if let iconName = responseToIcon(iconCode) {
                Image(systemName: iconName)
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFit()
                    .frame(width: 175, height: 175)
                    .opacity(0.9)
                    .padding()
            } else {
                Text("Icon not found") // Hata durumunda gösterilecek bir metin.
            }
            VStack(alignment: .leading) {
                Text("\(Int(weather.main.temp))°")
                    .font(.system(size: 55, weight: .bold, design: .default))
                    .foregroundColor(.black)
                Text(weather.weather.first?.description.capitalized ?? "N/A")
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(.black)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func responseToIcon(_ icon: String) -> String? {
        switch icon{
        case "01d" : return "sun.max.fill"
        case "01n" : return "sun.min.fill"
        case "02d" : return "cloud.sun.fill"
        case "02n" : return "cloud.moon.fill"
        case "03d" : return "cloud.fill"
        case "03n" : return "cloud.fill"
        case "04d" : return "smoke.fill"
        case "04n" : return "smoke.fill"
        case "09d" : return "cloud.rain.fill"
        case "09n" : return "cloud.rain.fill"
        case "10d" : return "cloud.sun.rain.fill"
        case "10n" : return "cloud.sun.rain.fill"
        case "11d" : return "cloud.bolt.fill"
        case "11n" : return "cloud.bolt.fill"
        case "13d" : return "snowflake"
        case "13n" : return "snowflake"
        case "50d" : return "cloud.fog.fill"
        case "50n" : return "cloud.fog.fill"
        default:
            return "bir hata oluştu"
        }
    }
}

struct MoreWeatherInfoBlocks : View {
    var weather: WeatherResponse
    
    var body: some View {
        RoundedRectangleBlock(blockColor: .white, icon: "thermometer.low", blockTitle: "Min Temp", infoText: "\(Int(weather.main.temp_min))°", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "thermometer.high", blockTitle: "Max Temp", infoText: "\(Int(weather.main.temp_max))°", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "wind", blockTitle: "Wind", infoText: "\(weather.wind.speed) Km/H", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "humidity.fill", blockTitle: "Humidity", infoText: "\(weather.main.humidity)%", textColor: .black)
    }
}


struct CityCountryText : View {
    @ObservedObject var locationManager: LocationDataManager
    var body: some View {
        VStack(alignment: .leading){
            Text("\(locationManager.district ?? "Unknown")")
                .font(.system(size: 45, weight: .bold, design: .default))
                .foregroundColor(.black)
            Text("\(locationManager.city ?? "Unknown")")
                .font(.system(size: 40, weight: .semibold, design: .default))
                .foregroundColor(.black)
            Text(formatDate(Date()))
                .font(.title3)
                .foregroundColor(.black)
        }.padding()
        
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter.string(from: date)
    }
}
