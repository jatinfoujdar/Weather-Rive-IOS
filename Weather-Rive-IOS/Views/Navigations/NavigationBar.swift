//
//  NavigationBar.swift
//  Weather-Rive-IOS
//
//  Created by jatin foujdar on 31/07/25.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.dismiss) var dismiss
    @Binding var searchText : String
    
    var body: some View {
        VStack(spacing: 8){
            HStack{
                Button{
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20).weight(.medium))
                            .foregroundStyle(.secondary)
                        
                        
                        Text("Weather")
                            .font(.title)
                            .foregroundStyle(.primary)
                    }
                    .frame(height: 44)
                    
                }
                
                Spacer()
                
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 28))
                    .frame(width: 44, height: 44, alignment: .trailing)
            }
            .frame(height: 52)
            
            HStack(spacing: 2){
                Image(systemName: "magnifyingglass")
                
                TextField("Search for city", text: $searchText)
            }
            .foregroundStyle(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment: .leading)
            .background(LinearGradientColor.bottomSheetBackground, in: RoundedRectangle(cornerRadius: 10))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: .black.opacity(0.25), lineWidth: 2, offsetX: 2, offsetY: 2, blur: 2)
            
        }
        .frame(height: 106, alignment: .top)
        .padding(.horizontal,16)
        .padding(.top,50)
        .backgroundBlur(radius: 20, opaque: true)
        .background(LinearGradientColor.navBarBackground)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationBar(searchText: .constant(("")))
}
