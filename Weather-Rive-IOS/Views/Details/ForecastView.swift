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
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                SegmentedControl(selection: $selection)
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
          .background(LinearGradientColor.bottomSheetBackground)
          .clipShape(RoundedRectangle(cornerRadius: 44))
          .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: LinearGradientColor.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
          .overlay {
              // MARK: Bottom Sheet Separator
              Divider()
                  .blendMode(.overlay)
                  .background(LinearGradientColor.bottomSheetBorderTop)
                  .frame(maxHeight: .infinity, alignment: .top)
                  .clipShape(RoundedRectangle(cornerRadius: 44))
          }
          .overlay {
              // MARK: Drag Indicator
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
