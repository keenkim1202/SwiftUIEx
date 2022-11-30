import SwiftUI

struct DetailedInfoTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .font(.title2)
            .bold()
    }
}

extension Text {
    func detailedInfoTitle() -> some View {
        modifier(DetailedInfoTitleModifier())
    }
}
