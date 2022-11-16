import SwiftUI

extension View {
    func toastView(toast: Binding<KeenToast?>) -> some View {
        self.modifier(KeenToastModifier(toast: toast))
    }
}
