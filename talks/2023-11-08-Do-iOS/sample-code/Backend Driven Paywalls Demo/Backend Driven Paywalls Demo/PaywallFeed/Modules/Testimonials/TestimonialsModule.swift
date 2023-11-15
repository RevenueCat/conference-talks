import Foundation

struct TestimonialsModule: Decodable {
    let title: String
    let testimonials: [Testimonial]
}

struct Testimonial: Decodable {
    let name: String
    let reviewText: String
}

extension TestimonialsModule {
    static func fixture() -> TestimonialsModule {
        TestimonialsModule(
            title: "Testimonials",
            testimonials: [
                Testimonial(name: "Catrick Stewart",
                            reviewText: "PawWall Pro has completely transformed my pet's social media experience!"),
                Testimonial(name: "Purrlock Holmes",
                            reviewText: "I can't get enough of PawWall Pro!"),
                Testimonial(name: "Furrnando Alonso",
                            reviewText: "PawWall Pro is a must-have app for every pet owner!"),
            ]
        )
    }
}
