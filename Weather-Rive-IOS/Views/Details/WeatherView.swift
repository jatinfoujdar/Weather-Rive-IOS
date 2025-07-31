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
