//
//  WebViewModel.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/17.
//

import Foundation

class WebViewModel: ObservableObject {
    @Published var isLoading: Bool = false // to know when the webView has finished loading so we can hide/show a loader indicator
    @Published var canGoBack: Bool = false // to know when the webView has navigated to another web page, and can go back
    @Published var shouldGoBack: Bool = false // communicate to the webView, that we want to go back to the previous web page
    @Published var title: String = ""
    
    var url: String // the path that we want to show in the WebView
    
    init(url: String) {
        self.url = url
    }
}
