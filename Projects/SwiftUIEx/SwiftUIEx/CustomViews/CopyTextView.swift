//
//  CopyTextView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/12.
//

import SwiftUI
import UIKit

struct CopyTextView: View {
    var someText: String?
    @State private var showingAlert = false
    @State var textfieldTexts: String = ""

    var body: some View {
        
        VStack {
            Text(someText ?? "no text.")
                .textSelection(.enabled)
            Button("copy") {
                UIPasteboard.general.string = someText
                
                if let storedString = UIPasteboard.general.string {
                    print(storedString)
                } else {
                    print("not copied - 1.")
                }
            }
            SimpleButton {
                Text(someText ?? "no text.")
            }
            .action {
                UIPasteboard.general.string = someText
                showingAlert = true
                
                if let storedString = UIPasteboard.general.string {
                    print(storedString)
                } else {
                    print("not copied - 2.")
                }
            }
            // .alert("Successfully Copied!", isPresented: $showingAlert) {
            //     Button("OK", role: .cancel) { }
            // }
            TextField("Enter your name", text: $textfieldTexts)
                .padding(10)
        }
    }
}

struct CopyTextView_Previews: PreviewProvider {
    static var previews: some View {
        CopyTextView(someText: "paste this!")
    }
}
