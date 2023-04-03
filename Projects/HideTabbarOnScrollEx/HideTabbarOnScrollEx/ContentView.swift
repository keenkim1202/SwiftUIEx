//
//  ContentView.swift
//  HideTabbarOnScrollEx
//
//  Created by KeenKim on 2023/03/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            MainView(bottomEdge: bottomEdge == 0 ? 10 : bottomEdge)
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
