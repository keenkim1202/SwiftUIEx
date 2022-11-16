//
//  ContentView.swift
//  ActivityViewEx
//
//  Created by KeenKim on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    @State var shareText: String = ""
    @State var isPresentActivityView: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("write text you want to share", text: $shareText)
                .background(.black.opacity(0.1))
                .padding(20)
            
            Button {
                self.isPresentActivityView.toggle()
            } label: {
                HStack {
                    Image(systemName: "sUIRquare.and.arrow.up")
                        .imageScale(.large)
                        .foregroundColor(.white)
                    Text("Share")
                        .foregroundColor(.white)
                }
                .padding(8)
                .background(.blue)
                .cornerRadius(8)
            }
            .sheet(isPresented: $isPresentActivityView) {
                ActivityViewController(activityItems: [$shareText.wrappedValue])
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        controller.completionWithItemsHandler = { activityType, completed, returnedItems, error in
            self.presentationMode.wrappedValue.dismiss()
        }

        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
