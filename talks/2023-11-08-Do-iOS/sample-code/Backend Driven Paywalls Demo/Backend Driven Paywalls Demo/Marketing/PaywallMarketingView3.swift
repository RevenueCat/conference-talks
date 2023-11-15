import SwiftUI
import RevenueCat

struct PaywallMarketingView3: View {
    var body: some View {
        TabView {
            feature(icon: "dollarsign",
                    iconColor: .green,
                    name: "Make more money!",
                    description: "Join Pawwall Pro and you'll be amazing at how much more money you'll make!")
            feature(icon: "figure.run",
                    iconColor: .pink,
                    name: "Do it fast!",
                    description: "Lorem ipsum delorem set something or another yada yada")
            feature(icon: "bolt.fill",
                    iconColor: .blue,
                    name: "Zap the competition",
                    description: "Lorem ipsum delorem set something or another yada yada")
            feature(icon: "square.fill",
                    iconColor: .purple,
                    name: "WALLS!",
                    description: "Lorem ipsum delorem set something or another yada yada")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(minHeight: 350)
    }
    
    private func feature(icon: String, iconColor: Color, name: String, description: String) -> some View {
        VStack(alignment: .center) {
            Color.clear.frame(height: 0)
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(iconColor)
                .padding()
                .frame(width: 200, height: 100)
                .background(iconColor.opacity(0.1))
                .background(.white.opacity(0.1))
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.bottom)
            Text(name)
                .font(.headline)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 2)
            Text(description)
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
        .padding(24)
        .frame(height: 250)
        .background(LinearGradient(colors: [Marketing.Color2, Marketing.Color1.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .foregroundColor(Marketing.Color5)
//        .padding(4)
//        .background(Color.red)
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(LinearGradient(colors: [.white.opacity(0.1), .clear, Marketing.Color1.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), style: .init(lineWidth: 2))
        )
        .padding()
    }
}

struct PaywallMarketingView3_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PaywallMarketingView3()
                .background(Marketing.Color2)
        }
    }
}
