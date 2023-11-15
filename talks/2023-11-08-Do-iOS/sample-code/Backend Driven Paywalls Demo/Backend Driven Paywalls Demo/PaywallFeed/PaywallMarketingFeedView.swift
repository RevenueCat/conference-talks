import SwiftUI
import RevenueCat

struct PaywallMarketingFeedView: View {
    var feedModules: [FeedModule]
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(feedModules) { module in
                switch module.type {
                case .header(let module):
                    HeaderModuleView(module: module)
                case .testimonial(let module):
                    TestimonialModuleView(module: module)
                case .features(let module):
                    FeaturesModuleView(module: module)
                case .chart(let module):
                    ChartModuleView(module: module)
                }
            }
        }
    }
}

#Preview {
    ScrollView(.vertical) {
        PaywallMarketingFeedView(feedModules: [
            .fixtureHeader(),
            .fixtureFeatures(),
            .fixtureTestimonials(),
            .fixtureChart()
        ])
    }
}
