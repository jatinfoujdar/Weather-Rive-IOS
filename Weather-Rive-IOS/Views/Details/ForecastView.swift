//
//  ForecastView.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 22/07/25.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0
    @Namespace private var animation
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                SegmentedControl(selection: $selection)
                forecastScrollView
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(LinearGradientColor.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(
            shape: RoundedRectangle(cornerRadius: 44),
            color: LinearGradientColor.bottomSheetBorderMiddle,
            lineWidth: 1,
            offsetX: 0,
            offsetY: 1,
            blur: 0,
            blendMode: .overlay,
            opacity: 1 - bottomSheetTranslationProrated
        )
        .overlay(separator)
        .overlay(dragIndicator)
    }
    
    // MARK: - Forecast Cards ScrollView with Transition
    private var forecastScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                if selection == 0 {
                    ForEach(Forecast.hourly) { forecast in
                        ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                    }
                    .transition(.offset(x: -430))
                } else {
                    ForEach(Forecast.weekly) { forecast in
                        ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                    }
                    .transition(.offset(x: 430))
                }
            }
            .padding(.vertical, 20)
            .animation(.easeInOut(duration: 0.4), value: selection)
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Top Separator
    private var separator: some View {
        Divider()
            .blendMode(.overlay)
            .background(LinearGradientColor.bottomSheetBorderTop)
            .frame(maxHeight: .infinity, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 44))
    }

    // MARK: - Drag Indicator
    private var dragIndicator: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black.opacity(0.3))
            .frame(width: 48, height: 5)
            .frame(height: 20)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ForecastView()
        .background(LinearGradientColor.background)
        .preferredColorScheme(.dark)
}
