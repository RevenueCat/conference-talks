import Foundation

struct FeaturesModule: Decodable {
    let title: String
    let features: [Feature]
}

struct Feature: Decodable {
    let sfSymbol: String
    let name: String
    let description: String
}

extension FeaturesModule {
    static func fixture() -> FeaturesModule {
        FeaturesModule(
            title: "Features",
            features: [
                Feature(sfSymbol: "bolt.fill",
                        name: "Money Machine",
                        description: "Make more money!"),
                Feature(sfSymbol: "bolt.fill",
                        name: "Name 2",
                        description: "TWO: This is a bunch of review text for the preview to show something interesting."),
                Feature(sfSymbol: "bolt.fill",
                        name: "Name 3",
                        description: "THREE: This is a bunch of review text for the preview to show something interesting."),
            ]
        )
    }
}
