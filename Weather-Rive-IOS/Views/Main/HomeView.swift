import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83
    case middle = 0.385

    var bottomSheetDetent: BottomSheet.PresentationDetent {
        .fraction(self.rawValue)
    }
}


struct HomeView: View {
    @State var isBottomSheetPresented = true
    @State private var selectedPosition: BottomSheetPosition = .middle

 
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
            ZStack {
                LinearGradientColor.background
                    .ignoresSafeArea()

                Image("Background")
                    .resizable()
                    .ignoresSafeArea()

                Image("House")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 257)

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

                EmptyView()
                    .sheetPlus(
                        isPresented: $isBottomSheetPresented,
                        background: (
                            ForecastView()
                        ),
                        main: {
                            EmptyView()
                                .presentationDetentsPlus(
                                    [.height(0), .medium, .large],
                                    selection: selectedDetent
                                )
                        }
                    )

                TabBarView(action: {
                    selectedPosition = .top
                    isBottomSheetPresented = true
                })

            }
            .navigationBarHidden(true)
        }
    }

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


#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
