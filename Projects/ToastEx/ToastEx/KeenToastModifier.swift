import SwiftUI

struct KeenToastModifier: ViewModifier {
    @Binding var toast: KeenToast?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                        // .offset(y: 30)
                }
                    .animation(.spring(), value: toast)
            )
            .onChange(of: toast) { _ in
                showToast()
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let toast = toast {
            VStack {
                Spacer()
                KeenToastView(
                    type: toast.type,
                    title: toast.title,
                    message: toast.message,
                    onCancel: dismissToast)
            }
            .transition(.move(edge: .top))
        }
    }
    
    private func showToast() {
        guard let toast = toast else { return }
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if toast.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
                dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
    
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}
