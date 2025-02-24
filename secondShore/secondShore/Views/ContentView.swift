import SwiftUI
import MapKit

struct ContentView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 54.2985, longitude: 16.1550), // Łazy, Polska
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    )

    @State private var showAIText = false

    var body: some View {
        VStack {
            Map(position: $position)
                 .mapStyle(.standard) 
                .ignoresSafeArea()
                .frame(height: 400)
                .accessibilityLabel("Mapa okolicy Łazów")

            Button("✨ Pokaż co jest na drugim brzegu") {
                withAnimation {
                    showAIText.toggle()
                }
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .accessibilityLabel("Pokaż tekst AI")

            if showAIText {
                ScrollView {
                    Text(aiGeneratedSampleText)
                        .padding()
                        .transition(.opacity)
                }
            }
        }
        .animation(.easeInOut, value: showAIText)
    }

    var aiGeneratedSampleText: String {
        """
        Po drugiej stronie Bałtyku, naprzeciw Łazów, rozciąga się południowe wybrzeże Szwecji, region Skanii. Znajdują się tam malownicze klify, lasy bukowe i małe rybackie miejscowości. Wśród nich jest Smygehuk, najbardziej wysunięty na południe punkt Szwecji, znany z latarni morskiej z 1883 roku i klimatycznych kawiarni, które serwują świeże lokalne śledzie.
        """
    }
}
#Preview {
    ContentView()
}
