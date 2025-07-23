import SwiftUI
import BottomSheet

// MARK: - Custom Detents

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83
    case middle = 0.385

    var bottomSheetDetent: BottomSheet.PresentationDetent {
        .fraction(self.rawValue)
    }
}

// MARK: - PreferenceKey to Track Y Offset

struct BottomSheetOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// MARK: - HomeView

struct HomeView: View {
    @State private var isBottomSheetPresented = true
    @State private var selectedPosition: BottomSheetPosition = .middle
    @State private var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue

    var bottomSheetTranslationProrated: CGFloat{
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    
    private var selectedDetent: Binding<BottomSheet.PresentationDetent> {
        Binding(
            get: { selectedPosition.bottomSheetDetent },
            set: { newValue in
                if let matched = BottomSheetPosition.allCases.first(where: { $0.bottomSheetDetent == newValue }) {
                    selectedPosition = matched
                }
            }
        )
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometryReader in
                let screenHeight = geometryReader.size.height + geometryReader.safeAreaInsets.top + geometryReader.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                ZStack {
                    LinearGradientColor.background
                        .ignoresSafeArea()
                    
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: bottomSheetTranslationProrated > 0 ? 0 * imageOffset : bottomSheetTranslationProrated > 1 ? -1 * imageOffset : -bottomSheetTranslationProrated * imageOffset)
                    
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: bottomSheetTranslationProrated > 0 ? 0 * imageOffset : bottomSheetTranslationProrated > 1 ? -1 * imageOffset : -bottomSheetTranslationProrated * imageOffset)
                    
                    VStack(spacing: -10) {
                        Text("Mumbai")
                            .font(.largeTitle)
                        
                        VStack {
                            Text(attributedString)
                            Text("H:24°  |  L:15° ")
                                .font(.title3.weight(.semibold))
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 51)
                    
                    // Bottom Sheet
                    EmptyView()
                        .sheetPlus(
                            isPresented: $isBottomSheetPresented,
                            background: ForecastView(),
                            main: {
                                GeometryReader { geo in
                                    Color.clear
                                        .preference(
                                            key: BottomSheetOffsetKey.self,
                                            value: geo.frame(in: .global).minY
                                        )
                                        .presentationDetentsPlus(
                                            [.height(0), .medium, .large],
                                            selection: selectedDetent
                                        )
                                }
                            }
                        )
                        .onPreferenceChange(BottomSheetOffsetKey.self) { value in
                            bottomSheetTranslation = value / screenHeight
                            //                        print("Bottom Sheet Y offset:", value)
                        }
                    
                    // Tab Bar
                    TabBarView(action: {
                        selectedPosition = .top
                        isBottomSheetPresented = true
                    })
                }
                .navigationBarHidden(true)
            }
        }
    }

    // MARK: - Attributed Weather Text

    private var attributedString: AttributedString {
        var string = AttributedString("19°\nMostly Clear")

        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }

        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }

        return string
    }
}

// MARK: - Preview

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
