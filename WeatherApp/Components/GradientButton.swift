//
//  GradientButton.swift
//  WeatherApp
//
//  Created by Gürkan Karadaş on 17.08.2024.
//

import SwiftUI

struct GradientButton: View {
    var text: String
    var icon: String
    var gradientColor1: Color
    var gradientColor2: Color
    var btnWidth: CGFloat
    var btnHeight: CGFloat
    var action : ()-> Void
    var body: some View {
        Button{
            action()
        } label: {
            HStack{
                Image(systemName: "\(icon)")
                Text("\(text)")
            }.foregroundColor(.black)
        }
        .frame(width: btnWidth, height: btnHeight)
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(colors: [gradientColor1, gradientColor2], startPoint: .bottomLeading, endPoint: .topTrailing)))
    }
}



#Preview {
    GradientButton(text: "Share Current Location", icon: "location.fill", gradientColor1: .softPurple, gradientColor2: .lightBlue, btnWidth: 250, btnHeight: 40){ print("button clicked")}
}
