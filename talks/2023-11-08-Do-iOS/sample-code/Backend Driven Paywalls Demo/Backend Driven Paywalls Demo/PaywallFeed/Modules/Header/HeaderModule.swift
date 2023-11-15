import Foundation

struct HeaderModule: Decodable {
    let title: String
    let imageUrl: String
}

extension HeaderModule {
    static func fixture() -> HeaderModule {
        HeaderModule(title: "Pawwall Pro",
                     imageUrl: "https://s3.us-east-2.amazonaws.com/media.charliemchapman.com/temp/sleeping-cat-transparent.png")
    }
}
