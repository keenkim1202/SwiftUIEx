//
//  WebView2View.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/17.
//

import SwiftUI

struct WebView2View: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: SecondView()) {
                Text("show web")
            }
            .navigationTitle("Navigation 1")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    struct SecondView: View {
        var body: some View {
            NavigationView {
                WebView2(url: URL(string: "https://www.naver.com"))
            }
            .navigationTitle("main")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WebView2View_Previews: PreviewProvider {
    static var previews: some View {
        WebView2View()
    }
}
