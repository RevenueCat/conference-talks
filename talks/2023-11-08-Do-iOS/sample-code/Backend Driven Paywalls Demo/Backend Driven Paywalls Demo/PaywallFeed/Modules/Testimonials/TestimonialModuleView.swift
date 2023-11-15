import SwiftUI

struct TestimonialModuleView: View {
    var module: TestimonialsModule
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(module.title)
                .font(.headline)
                .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(module.testimonials, id: \.name) { testimonial in
                        testimonialView(testimonial)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
        }
    }
    
    private func testimonialView(_ testimonial: Testimonial) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("⭐️⭐️⭐️⭐️⭐️")
                Spacer(minLength: 0)
                Text(testimonial.name)
                    .bold()
            }
            Text(testimonial.reviewText)
                .font(.callout)
            Spacer(minLength: 0)
        }
        .padding()
        .frame(width: 310, height: 130)
        .background(Marketing.Color1)
        .foregroundColor(Marketing.Color5)
        .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

#Preview {
    TestimonialModuleView(module: .fixture())
}
