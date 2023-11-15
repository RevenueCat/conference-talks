import SwiftUI
import RevenueCatUI

struct ContentView: View {
    @State var showDebug = false
    @State var showCustomPaywall = false
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    Button("Present Debug Overlay") {
                        showDebug = true
                    }
                    Button("Present Custom Paywall") {
                        showCustomPaywall = true
                    }
                }
            }
            .navigationTitle("Paywall Demo")
        }
        .debugRevenueCatOverlay(isPresented: $showDebug)
        .sheet(isPresented: $showCustomPaywall) { CustomPaywallView() }
    }
}

#Preview {
    ContentView()
}
