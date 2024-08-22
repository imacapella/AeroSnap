//
//  WeathersView.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 14.08.2024.
//

import SwiftUI

struct WeathersView: View {
    @State var locationManager: LocationDataManager
    var body: some View {
        ZStack{
            LinearGradient(colors: [ .softBlue, .lightBlue,], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(alignment: .leading){
                Spacer()
                CityCountryText(locationManager: LocationDataManager())
                    .frame(alignment: .leading)
                CurrentWeatherInfoBlock()
                    .padding()
                Spacer()
                ForecastWeatherInfoBlocks()
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    WeathersView(locationManager: LocationDataManager())
}

struct CurrentWeatherInfoBlock: View {
    var body: some View{
        HStack(spacing: 10){
            Image(systemName: "cloud.sun.fill")
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 175, height: 175)
                .opacity(0.9)
                .padding()
            VStack(alignment: .leading){
                Text("32°")
                    .font(.system(size: 55, weight: .bold, design: .default))
                    .foregroundColor(.black)
                Text("Cloudy")
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(.black)
            }
        }.preferredColorScheme(.dark)
    }
}

struct ForecastWeatherInfoBlocks : View {
    var body: some View {
        RoundedRectangleBlock(blockColor: .white, icon: "thermometer.low", blockTitle: "Min Temp", infoText: "15", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "thermometer.high", blockTitle: "Max Temp", infoText: "34", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "wind", blockTitle: "Wind", infoText: "15 Km/H", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "humidity.fill", blockTitle: "Min Temp", infoText: "%67", textColor: .black)
    }
}

struct CityCountryText : View {
    @ObservedObject var locationManager: LocationDataManager
    var body: some View {
        VStack(alignment: .leading){
            Text("\(locationManager.district ?? "Location not found")")
                .font(.system(size: 45, weight: .bold, design: .default))
                .foregroundColor(.black)
            Text("\(locationManager.city ?? "Location not found")")
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
