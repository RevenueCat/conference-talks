import SwiftUI
import RevenueCat

struct PaywallMarketingView2: View {
    @State var rotation: Double = 0.0
    @State var starOpacity: Double = 1
    
    var showFeatures: Bool = true
    var showTestimonials: Bool = true
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
            Image("cat-on-sill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask {
                    LinearGradient(colors: [.clear, .white, .white, .white, .clear], startPoint: .top, endPoint: .bottom)
                }
                .padding(.top, -60)
                .padding(.bottom, -80)
            
            HStack(spacing: 0) {
                Text("Pawwall ")
                    .font(.system(.largeTitle, design: .rounded).bold())
                    .foregroundColor(Marketing.Color5)
                    .padding(.leading)
                Text("Pro")
                    .font(.system(.largeTitle, design: .rounded).bold())
                Spacer(minLength: 0)
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .rotationEffect(Angle(degrees: rotation))
                    .opacity(starOpacity)
                    .padding(.trailing, 24)
                    .onAppear {
                        withAnimation(.linear(duration: 30)
                            .repeatForever(autoreverses: false)) {
                            rotation = 360.0
                        }
                        withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                            starOpacity = 0.75
                        }
                    }
            }
            .shadow(radius: 10)
            
            Text("Get your paws on all the great premium features of Pawall Pro! 😻")
                .padding(.horizontal)
            
            if showFeatures {
                Text("Premium features")
                    .font(.headline)
                    .padding(.top, 16)
                    .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        feature(icon: "dollarsign",
                                name: "Make more money!")
                        feature(icon: "figure.run",
                                name: "Do it fast!")
                        feature(icon: "bolt.fill",
                                name: "Zap the competition")
                        feature(icon: "square.fill",
                                name: "WALLS!")
                    }
                    .padding(.horizontal)
                }
            }
            
            if showTestimonials {
                Text("What others are saying")
                    .font(.headline)
                    .padding(.top, 16)
                    .padding(.horizontal)
                
                testimonial(name: "Garfield", review: "Five stars for this paywall builder app, because let's face it, lasagna isn't free and neither are my naps – it helps me monetize both with style!")
                testimonial(name: "Tom", review: "This paywall builder app is a game-changer in my pursuit of Jerry. With its cunning customization, I'm closer than ever to catching that elusive mouse!")
                testimonial(name: "Tony", review: "It's grrreat for locking up premium content behind paywalls. A real frosted flakes of a deal!")
            }
        }
        .foregroundColor(.white)
            
    }
    
    private func feature(icon: String, name: String) -> some View {
        VStack(alignment: .center) {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(height: 40)
            Spacer(minLength: 0)
            Text(name)
                .font(.subheadline)
                .bold()
                .multilineTextAlignment(.center)
        }
        .padding(2)
        .frame(width: 90, height: 90)
        .padding()
        .background(LinearGradient(colors: [Marketing.Color2, Marketing.Color1], startPoint: .topLeading, endPoint: .bottomTrailing))
        .foregroundColor(Marketing.Color5)
        .mask {
            RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
        }
    }
    
    private func testimonial(name: String, review: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("⭐️⭐️⭐️⭐️⭐️")
                    .font(.callout)
                Spacer(minLength: 8)
                Text(name)
                    .bold()
            }
            Text(review)
                .font(.callout)
            Spacer(minLength: 0)
        }
        .frame(height: 119)
        .padding()
        .background(LinearGradient(colors: [Marketing.Color5, Marketing.Color4.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .foregroundColor(Marketing.Color1)
        .mask {
            RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
        }
        .padding(.horizontal)
    }
}

struct PaywallMarketingView2_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PaywallMarketingView2()
        }.background(Marketing.Color3)
            .ignoresSafeArea(edges: .top)
    }
}
