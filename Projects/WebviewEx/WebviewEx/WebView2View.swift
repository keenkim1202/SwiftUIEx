//
//  WebView2View.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/17.
//

import SwiftUI

struct WebView2View: View {
    enum Links: String {
        case naver = "https://www.naver.com"
        case google = "https://www.google.com"
        case apple = "https://www.apple.com"
    }
    
    var body: some View {
        VStack {
            
            NavigationView {
                NavigationLink(destination: SecondView(urlString: Links.naver.rawValue)) {
                    Text("naver")
                }
                .navigationTitle("NAVER")
                .navigationBarTitleDisplayMode(.inline)
            }
            
            NavigationView {
                NavigationLink(destination: SecondView(urlString: Links.google.rawValue)) {
                    Text("google")
                }
                .navigationTitle("GOOGLE")
                .navigationBarTitleDisplayMode(.inline)
            }
            
            NavigationView {
                NavigationLink(destination: SecondView(urlString: Links.apple.rawValue)) {
                    Text("apple")
                }
                .navigationTitle("APPLE")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    struct SecondView: View {
        var urlString: String
        var webView: WebView2?
        
        init(urlString: String) {
            self.urlString = urlString
            self.webView = WebView2(url: URL(string: urlString))
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
        WebView2View()
        // WebView2View.SecondView(urlString: "https://www.naver.com")
        // WebView2(url: URL(string: "https://www.naver.com"))
    }
}
