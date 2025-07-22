//
//  ForecastView.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 22/07/25.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ScrollView{
            
        }
        .background(Blur(radius: 25, opaque: true))
        .background(LinearGradientColor.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .overlay{
            Divider()
                .blendMode(.overlay)
                .background(LinearGradientColor.bottomSheetBackground)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    ForecastView()
        .background(LinearGradientColor.background)
        .preferredColorScheme(.dark)
}
