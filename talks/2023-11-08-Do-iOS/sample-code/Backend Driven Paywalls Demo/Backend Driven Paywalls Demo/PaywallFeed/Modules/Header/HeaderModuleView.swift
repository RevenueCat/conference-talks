import SwiftUI

struct HeaderModuleView: View {
    var module: HeaderModule
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: module.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 128, height: 128)
                
            Text(module.title)
                .font(.largeTitle).bold()
        }
        .padding(.top)
    }
}

#Preview {
    HeaderModuleView(module: .fixture())
}
