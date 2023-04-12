//
//  Home.swift
//  HideTabbarOnScrollEx2
//
//  Created by KeenKim on 2023/04/12.
//

import SwiftUI

struct Home: View {
    @State var currentTab: CustomTab = .home
    
    // init() {
    //     UITabBar.appearance().isHidden = true
    // }
    
    var body: some View {
        TabView(selection: $currentTab) {
            Text("Address")
                .tag(CustomTab.home)
            Text("Favorite")
                .tag(CustomTab.favorite)
        }
    }
}

struct Home_Previes: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
