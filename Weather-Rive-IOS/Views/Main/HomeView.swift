//
//  HomeView.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 21/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            LinearGradientColor.background
                .ignoresSafeArea()
            
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            Image("House")
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 257)
            
            
            VStack(spacing: -10){
                Text("Mumbai")
                    .font(.largeTitle)
                
                VStack{
                    Text("19°")
                        .font(.system(size:96, weight: .thin))
                        .foregroundStyle(.primary)
                    +
                    Text("\n ")
                    +
                    Text("Mostly Clear")
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(.secondary)
                    
                    Text("H:24° C  |  L:15° C")
                        .font(.title3.weight(.semibold))
                }
                
                Spacer()
            }
            .padding(.top, 51)
            
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
