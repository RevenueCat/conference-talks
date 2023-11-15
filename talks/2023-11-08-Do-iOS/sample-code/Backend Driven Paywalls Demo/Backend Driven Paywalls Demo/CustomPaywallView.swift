import SwiftUI
import RevenueCat
import RevenueCatUI

struct CustomPaywallView: View {
    @State var feedModules: [FeedModule] = []
    
    var body: some View {
        ScrollView {
            if feedModules.isEmpty {
                spinner
            } else {
                PaywallMarketingFeedView(feedModules: feedModules)
            }
        }
        .background(Marketing.Color3)
        .foregroundColor(.white)
        .paywallFooter(condensed: true)
        .task {
            feedModules = await SubscriptionService.shared.getOfferingFeed()
        }
    }
    
    var spinner: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .padding(.top, 200)
    }
}

#Preview {
    CustomPaywallView()
}
