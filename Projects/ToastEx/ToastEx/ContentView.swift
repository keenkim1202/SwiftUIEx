// Ref: https://betterprogramming.pub/swiftui-create-a-fancy-toast-component-in-10-minutes-e6bae6021984

import SwiftUI

struct ContentView: View {
    @State private var toast: KeenToast? = nil
    
    var body: some View {
        VStack {
            Button {
                toast = KeenToast(type: .info, title: "Toast info", message: "This is info message.")
            } label: {
                Text("Show Toast!")
            }
        }
        .toastView(toast: $toast)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
