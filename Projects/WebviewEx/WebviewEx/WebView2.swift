//
//  WebView2.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/17.
//

import SwiftUI
import WebKit

struct WebView2: UIViewRepresentable {
    let url: URL?
    private var webView: WKWebView?
    
    init(url: URL?) {
        self.webView = WKWebView()
        self.url = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView!
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = url else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    func canGoBack() {
        webView?.goBack()
    }
    
    func canGoForward() {
        webView?.goForward()
    }
    
    func reload() {
        webView?.reload()
    }
}
