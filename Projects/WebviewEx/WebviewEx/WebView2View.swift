//
//  WebView2View.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/17.
//

import SwiftUI

struct WebView2View: View {
    @State var link: String
    
    var body: some View {
        VStack {
            TextField("enter address", text: $link)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            
            NavigationView {
                NavigationLink(destination: SecondView(urlString: $link)) {
                    Text("show web")
                }
                .navigationTitle("Navigation 1")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    struct SecondView: View {
        var urlString: Binding<String>
        var webView: WebView2?
        
        init(urlString: Binding<String>) {
            self.urlString = urlString
            self.webView = WebView2(url: URL(string: urlString.wrappedValue))
        }

        var body: some View {
            NavigationView {
                webView
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button {
                                webView?.canGoBack()
                            } label: {
                                Image(systemName: "arrow.backward")
                            }
                        
                            Button {
                                webView?.canGoForward()
                            } label: {
                                Image(systemName: "arrow.forward")
                            }
                        
                            Spacer()
                            Button {
                                webView?.reload()
                            } label: {
                                Image(systemName: "arrow.clockwise")
                            }
                        }
                    }
            }
            .navigationTitle("main")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

struct WebView2View_Previews: PreviewProvider {
    static var previews: some View {
        WebView2View(link: "https://www.naver.com")
        // WebView2View.SecondView(urlString: "https://www.naver.com")
        // WebView2(url: URL(string: "https://www.naver.com"))
    }
}
