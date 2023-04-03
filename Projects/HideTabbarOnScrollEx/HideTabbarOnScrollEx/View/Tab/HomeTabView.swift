//
//  HomeTabView.swift
//  HideTabbarOnScrollEx
//
//  Created by KeenKim on 2023/03/20.
//

import SwiftUI

struct HomeTabView: View {
    @Binding var hideBar: Bool
    var bottomEdge: CGFloat
    
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Contacts")
                    .font(.callout)
                    .padding([.leading, .trailing])
                ForEach(Address.list, id: \.name) { address in
                    CardView(address: address)
                }
            }
            .overlay(
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    // duration to hide tabbar
                    let durationOffset: CGFloat = 35
                    
                    DispatchQueue.main.async {
                        if minY < offset {
                            if offset < 0, -minY > (lastOffset + durationOffset) {
                                // hide tab
                                withAnimation(.easeOut.speed(1.5)) { hideBar = true }
                                lastOffset = -offset
                            }
                        }
                        
                        if minY > offset, -minY < (lastOffset - durationOffset) {
                            // show tab
                            withAnimation(.easeOut.speed(1.5)) { hideBar = false }
                            lastOffset = -offset
                        }
                        
                        self.offset = minY
                    }
                    
                    return .clear
                }
            )
            .padding(.bottom, 15 + 35 + bottomEdge)
        }
        .onAppear {
            // disalbe bounce
            UIScrollView.appearance().bounces = false
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    func randomColor() -> Color {
        let colors: [Color] = [.red, .pink, .yellow, .green, .blue, .purple]
        return colors.randomElement() ?? .gray
    }
    
    @ViewBuilder
    func CardView(address: Address) -> some View {
        HStack(spacing: 16) {
            Text(String(address.name.first ?? "-"))
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 50, height: 50)
                .background(randomColor(), in: Circle())
            VStack(alignment: .leading, spacing: 8) {
                Text("name: \(address.name)")
                    .font(.headline)
                Text("phone: \(address.phone)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding([.leading, .trailing])
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
