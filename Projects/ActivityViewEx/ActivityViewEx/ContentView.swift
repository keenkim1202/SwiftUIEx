//
//  ContentView.swift
//  ActivityViewEx
//
//  Created by KeenKim on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    // @State var isPresented: Bool = false
    
    var body: some View {
        // VStack(alignment: .center) {
        //     Button {
        //         self.isPresented = true
        //     } label: {
        //         HStack {
        //             Text("Show Button View")
        //                 .foregroundColor(.white)
        //         }
        //         .padding(8)
        //         .background(.blue)
        //         .cornerRadius(8)
        //     }
        //     .sheet(isPresented: $isPresented) {
        //         SheetView()
        //     }
        // }
        SheetView()
    }
    
    struct SheetView: View {
        @State private var isShare = false
        @State var shareText: String = ""
        
        var body: some View {
            VStack {
                TextField("write text you want to share", text: $shareText)
                    .background(.black.opacity(0.1))
                    .padding(20)
                
                Button {
                    isShare = true
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Share")
                            .foregroundColor(.white)
                    }
                    .padding(8)
                    .background(.blue)
                    .cornerRadius(8)
                }
                .background(SharingViewController(isPresenting: $isShare) {
                    let activityVC = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
                    activityVC.completionWithItemsHandler = { _, _, _, _ in
                        isShare = false
                    }
                    
                    return activityVC
                })
            }
        }
    }
    
    struct SharingViewController: UIViewControllerRepresentable {
        @Binding var isPresenting: Bool
        var content: () -> UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            UIViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            if isPresenting {
                uiViewController.present(content(), animated: true)
            }
        }
    }
}
