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
                    RoundedRectangle(cornerRadius: 20)
                        .fill(blockColor)
                        .opacity(0.3)
                        .shadow(radius: 2)
                        .frame(width: geometry.size.width * 0.9, height: 55)
                        .overlay(
                            HStack(spacing: 15) {
                                // İkonun bulunduğu kare kutucuk
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Image(systemName: icon)
                                            .resizable()
                                            .renderingMode(.original)
                                            .scaledToFit()
                                            .frame(width: 27, height: 27)
                                            .foregroundColor(.blue)
                                            .padding()
                                    )
                                
                                // Başlık ve Değer
                                Text("\(blockTitle): \(infoText)")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(textColor)
                                
                                Spacer()
                            }
                 //           .padding(.horizontal)
                        )
                }
                .padding(.horizontal)
            }
            .frame(height: 60)  // Sabit bir yükseklik ayarladık, isteğe bağlı olarak dinamik yapabilirsiniz.
        }
    }
}



#Preview {
    RoundedRectangleBlock(blockColor: .white, icon: "location.fill", blockTitle: "Location", infoText: "32", textColor: .black)
}

