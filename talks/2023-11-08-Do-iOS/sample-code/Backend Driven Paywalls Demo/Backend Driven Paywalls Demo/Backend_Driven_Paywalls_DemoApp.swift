import SwiftUI
import RevenueCat

@main
struct Backend_Driven_Paywalls_DemoApp: App {
    init() {
        /// This API Key is for my personal test project in RevenueCat
        /// You can switch this to your own project and set your offering metadata
        /// to the same json content in the file paywall-metadata-example.json found
        /// at the root of this Xcode project
        Purchases.configure(with: .init(withAPIKey: "appl_arncwcTwVuMIZKUkCgRLUSHuKps"))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
