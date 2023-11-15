import Foundation

struct FeedModule: Identifiable {
    var id: String
    var type: FeedModuleType
    
    init?(anyDecodableFeedModule: AnyDecodableFeedModule) {
        self.id = anyDecodableFeedModule.id
        
        switch(anyDecodableFeedModule.type) {
        case .header:
            guard let module = anyDecodableFeedModule.module as? HeaderModule else { return nil }
            self.type = .header(module)
        case .testimonial:
            guard let module = anyDecodableFeedModule.module as? TestimonialsModule else { return nil }
            self.type = .testimonial(module)
        case .features:
            guard let module = anyDecodableFeedModule.module as? FeaturesModule else { return nil }
            self.type = .features(module)
        case .chart:
            guard let module = anyDecodableFeedModule.module as? ChartModule else { return nil }
            self.type = .chart(module)
        }
    }
    
    fileprivate init(id: String, type: FeedModuleType) {
        self.id = id
        self.type = type
    }
}

enum FeedModuleType {
    case header(HeaderModule)
    case testimonial(TestimonialsModule)
    case features(FeaturesModule)
    case chart(ChartModule)
}

extension FeedModule {
    static func fixtureHeader() -> FeedModule {
        FeedModule(id: "header-module", type: .header(.fixture()))
    }
    
    static func fixtureTestimonials() -> FeedModule {
        FeedModule(id: "testimonials-module", type: .testimonial(.fixture()))
    }
    
    static func fixtureFeatures() -> FeedModule {
        FeedModule(id: "features-module", type: .features(.fixture()))
    }
    
    static func fixtureChart() -> FeedModule {
        FeedModule(id: "chart-module", type: .chart(.fixture()))
    }
}
