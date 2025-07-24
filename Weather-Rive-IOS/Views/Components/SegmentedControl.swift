//
//  SegmentedControl.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 24/07/25.
//

import SwiftUI

struct SegmentedControl: View {
    @Binding var selection: Int

    var body: some View {
        VStack(spacing: 5){
            HStack{
                Button{
                    selection = 0
                }label: {
                    Text("Hourly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                
                
                Button{
                    selection = 1
                }label: {
                    Text("Weekly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(.secondary)
            
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: .black.opacity(0.2), radius: 0 ,x: 0, y: 1)
                .blendMode(.overlay)
        }
        .padding(.top,25)
    }
}

#Preview {
    SegmentedControl(selection: .constant(0))
}
