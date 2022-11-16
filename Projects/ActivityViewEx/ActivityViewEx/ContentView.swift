//
//  ContentView.swift
//  ActivityViewEx
//
//  Created by KeenKim on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    @State var shareText: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("write text you want to share", text: $shareText)
                .background(.black.opacity(0.1))
                .padding(20)
            
            Button {
                shareAction(text: shareText)
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
        }
    }
    
    func shareAction(text: String) {
        let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first,
              let rootVC = firstWindow.rootViewController
        else { return }
        
        rootVC.present(activityVC, animated: true)
    }
}
