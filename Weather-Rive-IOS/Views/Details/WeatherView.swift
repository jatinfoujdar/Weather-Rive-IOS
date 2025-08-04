//
//  WeatherView.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 31/07/25.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText: String = ""
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
            .safeAreaInset(edge: .top){
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            NavigationBar()
        }
        .navigationBarHidden(true)
        .searchable(text: $searchText)
    }
}

#Preview {
    NavigationView {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
