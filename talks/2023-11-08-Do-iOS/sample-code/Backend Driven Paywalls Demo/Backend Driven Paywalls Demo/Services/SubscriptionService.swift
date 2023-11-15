import Foundation
import RevenueCat

class SubscriptionService {
    static let shared: SubscriptionService = SubscriptionService()
    
    func getOfferingFeed() async -> [FeedModule] {
        do {
            guard let offering = try await Purchases.shared.offerings().current,
                  let array = offering.metadata["feed"] as? [Any]  else { return [] }
            let items = try JSONSerialization.data(withJSONObject: array)
            let decoder = JSONDecoder()
            let anyFeedModules = try decoder.decode([AnyDecodableFeedModule].self, from: items)
                        
            let feedModules = anyFeedModules.compactMap { FeedModule(anyDecodableFeedModule: $0) }
            return feedModules
        } catch {
            print("Error: \(error)")
            return []
        }
    }
}
