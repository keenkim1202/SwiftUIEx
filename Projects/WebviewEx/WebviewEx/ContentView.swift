//
//  ContentView.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var webViewModel = WebViewModel(url: "https://www.naver.com/")
    
    var body: some View {
        NavigationView {
            ZStack {
                WebViewContainer(webViewModel: webViewModel)
                if webViewModel.isLoading {
                    VStack {
                        Text("Loading...")
                        ActivityIndicator(isAnimating: .constant(true), style: .large)
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(webViewModel.isLoading ? 1 : 0)
                }
            }
            .navigationBarTitle(Text(webViewModel.title), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                webViewModel.shouldGoBack.toggle()
            }, label: {
                if webViewModel.canGoBack {
                    Image(systemName: "arrow.left")
                        .frame(width: 44, height: 44, alignment: .center)
                        .foregroundColor(.black)
                } else {
                    EmptyView()
                        .frame(width: 0, height: 0, alignment: .center)
                }
            })
            )
        }
        .navigationTitle("webview")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
