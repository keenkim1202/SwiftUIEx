import SwiftUI

struct DetailedInfoTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .font(.title2)
            .bold()
    }
}

struct ButtonLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding(.horizontal, 30)
            .padding(.vertical, 8)
            .foregroundColor(.pink)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.pink, lineWidth: 1.5)
            }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .padding(.horizontal, 30)
            .padding(.vertical, 8)
            .foregroundColor(.pink)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.pink, lineWidth: 1.5)
            }
    }
}

extension Text {
    func detailedInfoTitle() -> some View {
        modifier(DetailedInfoTitleModifier())
    }
    
    func buttonLabel() -> some View {
        modifier(ButtonLabelModifier())
    }
}
