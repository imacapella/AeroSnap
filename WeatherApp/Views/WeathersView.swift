//
//  WeathersView.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 14.08.2024.
//

import SwiftUI

struct WeathersView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.softYellow, .softOrange], startPoint: .top, endPoint: .bottom)
            VStack(alignment: .leading){
                CityCountryText()
                    .frame(alignment: .leading)
                CurrentWeatherInfoBlock()
                //Spacer()
                ForecastWeatherInfoBlocks()
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
            .padding()
    }
}

#Preview {
    WeathersView()
}

struct CurrentWeatherInfoBlock: View {
    var body: some View{
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 15)
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.6)
                .padding()
                .opacity(0.1)
                .shadow(radius: 5)
                .overlay(){
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
                            Text("Cloudy")
                                .font(.system(size: 25, weight: .bold, design: .default))
                        }
                    }.preferredColorScheme(.dark)
                }
        }
    }
}

struct ForecastWeatherInfoBlocks : View {
    var body: some View {
        RoundedRectangleBlock(blockColor: .white, icon: "thermometer.sun.fill", blockTitle: "Min Temp", infoText: "76", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "thermometer.sun.fill", blockTitle: "Min Temp", infoText: "76", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "thermometer.sun.fill", blockTitle: "Min Temp", infoText: "76", textColor: .black)
        RoundedRectangleBlock(blockColor: .white, icon: "thermometer.sun.fill", blockTitle: "Min Temp", infoText: "76", textColor: .black)
    }
}

struct CityCountryText : View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Beykoz,")
                .font(.system(size: 45, weight: .bold, design: .default))
            Text("Istanbul")
                .font(.system(size: 40, weight: .semibold, design: .default))
            Text(formatDate(Date()))
                        .font(.title3)
                        .foregroundColor(.white)
        }.padding()
        
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter.string(from: date)
    }
}
