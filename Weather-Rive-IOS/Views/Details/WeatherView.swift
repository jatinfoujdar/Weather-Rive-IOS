//
//  WeatherView.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 31/07/25.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack{
            LinearGradientColor.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 20){
                    ForEach(Forecast.cities){forecast in
                    WeatherWidget(forecast: forecast)
                    }
                }
            }
        }
        .overlay{
            NavigationBar()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    WeatherView()
        .preferredColorScheme(.dark)
}
