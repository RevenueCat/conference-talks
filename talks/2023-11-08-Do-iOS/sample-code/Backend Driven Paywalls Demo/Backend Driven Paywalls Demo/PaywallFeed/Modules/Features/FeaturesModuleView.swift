import SwiftUI

struct FeaturesModuleView: View {
    var module: FeaturesModule
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(module.title)
                .font(.headline)
                .padding(.horizontal)
            ForEach(module.features, id: \.name) { feature in
                featureView(feature)
            }
        }
    }
    
    private func featureView(_ feature: Feature) -> some View {
        HStack(alignment: .top) {
            Image(systemName: feature.sfSymbol)
                .font(.system(size: 10))
                .frame(width: 22, height: 22)
                .background(Marketing.Color2)
                .foregroundColor(Marketing.Color5)
                .mask(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(feature.name)
                    .font(.system(size: 14))
                    .bold()
                Text(feature.description)
                    .font(.system(size: 12))
            }
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    FeaturesModuleView(module: .fixture())
}
