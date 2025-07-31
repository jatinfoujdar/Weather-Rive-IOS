//
//  TabBarView.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 21/07/25.
//

import SwiftUI

struct TabBarView: View {
    var action : () -> Void
    
    var body: some View {
        ZStack{
            HStack{
                Button{
                    action()
                }label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                NavigationLink{
                    WeatherView()
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title2)
            .foregroundStyle(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        
    }
}

#Preview {
    TabBarView(action: {})
        .preferredColorScheme(.dark)
}
