//
//  CustomTabbar.swift
//  HideTabbarOnScrollEx
//
//  Created by KeenKim on 2023/03/20.
//

import SwiftUI

struct CustomTabbar: View {
    let tabs: [CustomTab] = [.home, .favorite]
    
    @Binding var currentTab: CustomTab
    var bottomEdge: CGFloat
    
    var body: some View {
        HStack(spacing: 0) {
            // Tab buttons
            ForEach(tabs, id: \.self) { tab in
                TabButton(tab: tab, currentTab: $currentTab, badge: tab == .home ? 10 : 0)
            }
        }
        .padding(.top, 15)
        .padding(.bottom, bottomEdge)
        .background(.white)
    }
    
    struct TabButton: View {
        var tab: CustomTab
        @Binding var currentTab: CustomTab
        
        var badge: Int = 0
        
        var body: some View {
            Button {
                withAnimation { currentTab = tab }
            } label: {
                Image(systemName: tab.rawValue)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(currentTab == tab ? .green : .gray.opacity(0.7))
                    .overlay(
                        Text("\(badge < 100 ? badge : 99)+")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 5)
                            .background(.red, in: Capsule())
                            .background(Capsule().stroke(.white, lineWidth: 4))
                            .offset(x: 20, y: -5)
                            .opacity(badge == 0 ? 0 : 1),
                        alignment: .topTrailing
                    )
                    .frame(maxWidth: .infinity)
            }

        }
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
