//
//  WebViewContainer.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/17.
//

import UIKit
import SwiftUI
import WebKit

struct WebViewContainer: UIViewRepresentable {
    @ObservedObject var webViewModel: WebViewModel
    
    // here we are initialising the Coordinator (we’ll explain how to create it in a second)
    func makeCoordinator() -> WebViewContainer.Coordinator {
        Coordinator(self, webViewModel)
    }
    
    // here we are creating the WKWebView and loading the URL request.
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.webViewModel.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(request)
        
        return webView
    }
    
    // here we will update the UI when there is a change in our webViewModel, in this case, if the user tap in the go back button, we will tell the WKWebView to goBack().
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if webViewModel.shouldGoBack {
            uiView.goBack()
            webViewModel.shouldGoBack = false
        }
    }
}
