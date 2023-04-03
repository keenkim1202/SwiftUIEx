//
//  MainView.swift
//  HideTabbarOnScrollEx
//
//  Created by KeenKim on 2023/03/20.
//

import SwiftUI
// https://www.youtube.com/watch?v=1RGd-I7KNVA&t=58s
struct MainView: View {
    @State var currentTab: CustomTab = .home
    var bottomEdge: CGFloat
    
    @State var hideBar = false
    
    init(bottomEdge: CGFloat) {
        UITabBar.appearance().isHidden = false
        self.bottomEdge = bottomEdge
    }
    
    var body: some View {
        // TabView with Custom TabButton
        TabView(selection: $currentTab) {
            HomeTabView(hideBar: $hideBar, bottomEdge: bottomEdge)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.primary.opacity(0.05))
                .tag(CustomTab.home.rawValue)
            FavoriteTabView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.primary.opacity(0.05))
                .tag(CustomTab.favorite.rawValue)
        }
        .overlay(
            VStack(spacing: 0) {
                // info view
                Button {
                    withAnimation { hideBar.toggle() }
                } label: {
                    InfoView()
                }
                .opacity(currentTab == .home ? 1 : 0)
                .animation(.none, value: currentTab) // no animation
                // custom tabbar
                CustomTabbar(currentTab: $currentTab, bottomEdge: bottomEdge)
            }
            // top padding = 15, infoview hight = 60, bottom edge
            .offset(y: hideBar ? (15 + 35 + bottomEdge) : 0)
            ,alignment: .bottom
        )
    }
    
    struct InfoView: View {
        var body: some View {
            ZStack {
                Rectangle()
                    .frame(height: 60)
                    .roundedCorner(8, corners: [.topLeft, .topRight])
                    .foregroundColor(.blue)
                    .opacity(0.5)
                HStack {
                    Text("Do you need help?")
                        .foregroundColor(.white)
                    Text("Click here")
                        .underline()
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
