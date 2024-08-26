//
//  RoundedRectangleBlock.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 20.08.2024.
//

import SwiftUI

struct RoundedRectangleBlock: View {
    var blockColor: Color
    var icon: String
    var blockTitle: String
    var infoText: String
    var textColor: Color
    
    var body: some View {
        ZStack {
           // LinearGradient(colors: [.softYellow, .softOrange], startPoint: .topLeading, endPoint: .bottomTrailing)
            GeometryReader { geometry in
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(blockColor)
                        .opacity(0.35)
                        .frame(width: geometry.size.width * 0.9, height: 55)
                        .overlay(
                            HStack() {
                                // İkonun bulunduğu kare kutucuk
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .shadow(radius: 2)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Image(systemName: icon)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 27, height: 27)
                                            .foregroundColor(.blue)
                                            .padding()
                                    )
                                    //.padding()
                                
                                // Başlık ve Değer
                                Text("\(blockTitle): \(infoText)")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(textColor)
                                    //.padding()
                                Spacer()
                            }
                            .padding(.horizontal)
                        )
                }
                .padding(.horizontal)
            }
            .frame(height: 60)  
        }
    }
}

struct CurrentWeatherInfoBlockDemo: View {
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
                                .font(.system(size: 55, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                            Text("Cloudy")
                                .font(.system(size: 25, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                            
                        }
                    }.preferredColorScheme(.dark)
                }
        }



#Preview {
    ZStack{
        LinearGradient(colors: [.white, .lightBlue, .softBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
        VStack {
            RoundedRectangleBlock(blockColor: .white, icon: "thermometer.low", blockTitle: "Min Temp", infoText: "15", textColor: .black)
            RoundedRectangleBlock(blockColor: .white, icon: "thermometer.high", blockTitle: "Max Temp", infoText: "15", textColor: .black)
            CurrentWeatherInfoBlockDemo()

        }
            }.edgesIgnoringSafeArea(.all)
    
}

