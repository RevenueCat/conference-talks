import SwiftUI

struct PaywallMarketingView1: View {
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Spacer(minLength: 0)
                Circle().fill(Marketing.Color5).frame(height: 150)
                Spacer(minLength: 0)
            }
            Text("Look at all this marketing content!")
                .font(.largeTitle.bold())
                .padding(.horizontal)
            Text("There's just so much to look at and it's all so pretty it's hard to believe.")
                .padding(.horizontal)
            Text("Look at these squares!")
                .font(.headline)
                .padding(.top, 16)
                .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack {
                    RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
                        .fill(Marketing.Color2)
                        .frame(width: 150, height: 150)
                    RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
                        .fill(Marketing.Color4)
                        .frame(width: 150, height: 150)
                    RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
                        .fill(Marketing.Color1)
                        .frame(width: 150, height: 150)
                    RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
                        .fill(Marketing.Color5)
                        .frame(width: 150, height: 150)
                }
                .padding(.horizontal)
            }
            
            Text("And all these beautiful rectangles!")
                .font(.headline)
                .padding(.top, 16)
                .padding(.horizontal)
            RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
                .fill(.ultraThinMaterial)
                .frame(height: 200)
                .padding(.horizontal)
            RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
                .fill(.ultraThinMaterial)
                .frame(height: 200)
                .padding(.horizontal)
            RoundedRectangle(cornerSize: .init(width: 10, height: 10), style: .continuous)
                .fill(.ultraThinMaterial)
                .frame(height: 200)
                .padding(.horizontal)
        }
        .foregroundColor(.white)
        .background(Marketing.Color3, ignoresSafeAreaEdges: .all)
    }
}

struct PaywallMarketingView1_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PaywallMarketingView1()
        }.background(Marketing.Color3)
    }
}
