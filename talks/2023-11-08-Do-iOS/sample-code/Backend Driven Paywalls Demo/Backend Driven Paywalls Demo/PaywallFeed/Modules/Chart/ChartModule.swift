import Foundation

struct ChartModule: Decodable {
    let title: String
    let chartRows: [ChartRow]
}

struct ChartRow: Decodable {
    let name: String
    let isFree: Bool
    let isPro: Bool
}

extension ChartModule {
    static func fixture() -> ChartModule {
        ChartModule(title: "Chart Module",
                    chartRows: [
                        ChartRow(name: "Free feature 01", isFree: true, isPro: true),
                        ChartRow(name: "Free feature 02", isFree: true, isPro: true),
                        ChartRow(name: "Pro feature 01", isFree: false, isPro: true),
                        ChartRow(name: "Pro feature 02", isFree: false, isPro: true),
                        ChartRow(name: "Pro feature 03", isFree: false, isPro: true),
                        ChartRow(name: "Pro feature 04", isFree: false, isPro: true),
                        ChartRow(name: "Free feature 03", isFree: true, isPro: true),
                        ChartRow(name: "Pro feature 05", isFree: false, isPro: true)
                    ])
    }
}
