import Foundation

enum GenericFeedModuleType: String, Decodable {
    case header
    case testimonial
    case features
    case chart
}

protocol DecodableFeedModule: Decodable {
    associatedtype Value
    
    var id: String { get }
    var type: GenericFeedModuleType { get }
    var module: Value { get }
}

struct GenericFeedModule<T: DecodableFeedModule>: Decodable, Identifiable {
    let id: String
    let type: GenericFeedModuleType
    let module: T.Value
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case module
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(GenericFeedModuleType.self, forKey: .type)
        
        switch type {
        case .header:
            module = try container.decode(HeaderModule.self, forKey: .module) as! T.Value
        case .testimonial:
            module = try container.decode(TestimonialsModule.self, forKey: .module) as! T.Value
        case .features:
            module = try container.decode(FeaturesModule.self, forKey: .module) as! T.Value
        case .chart:
            module = try container.decode(ChartModule.self, forKey: .module) as! T.Value
        }
    }
}

struct AnyDecodableFeedModule: DecodableFeedModule {
    let id: String
    let type: GenericFeedModuleType
    let module: Any
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let genericContainer = try container.decode(GenericFeedModule<AnyDecodableFeedModule>.self)
        self.id = genericContainer.id
        self.type = genericContainer.type
        self.module = genericContainer.module
    }
}
