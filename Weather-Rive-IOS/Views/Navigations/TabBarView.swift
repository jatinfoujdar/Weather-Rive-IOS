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
            Text("TabBarView")
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        
    }
}

#Preview {
    TabBarView(action: {})
        .preferredColorScheme(.dark)
}
