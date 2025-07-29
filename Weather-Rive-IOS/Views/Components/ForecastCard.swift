//
//  ForecastCard.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 29/07/25.
//

import SwiftUI

struct ForecastCard: View {
    var forecast: Forecast
    var forecastPeriod: ForecastPeriod
    var isActive: Bool = true
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradientColor.forecastCardBackground.opacity(isActive ? 1 : 0.2))
                .frame(width: 60, height: 146)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
            
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(.white.opacity(isActive ? 0.5 :0.2))
                .blendMode(.overlay)
            
                .innerShadow(shape: RoundedRectangle(cornerRadius: 30), color: .white.opacity(0.25), lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)
            
            VStack(spacing: 16){
                Text(forecast.date, format: forecastPeriod == ForecastPeriod.hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))
            }
            .padding(.horizontal,8)
            .padding(.vertical, 16)
            .frame(width: 60 , height: 146)
        }
    }
}

#Preview {
    ForecastCard(forecast: Forecast.hourly[0], forecastPeriod: .hourly)
}
