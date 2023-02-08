//
//  ContentView.swift
//  ZStackAndHStack
//
//  Created by KeenKim on 2023/02/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CollapsableView(title: "First Section")
            CollapsableView(title: "Second Section")
            CollapsableView(title: "Third Section")
            CollapsableView(title: "Fourth Section")

            Spacer()
        }
        .padding([.leading, .trailing], 16)
    }
    

    struct CollapsableView: View {
        @State var isCollapsed: Bool = false
        var title: String
        
        var body: some View {
            DisclosureGroup(isExpanded: $isCollapsed) {
                DetailView()
            } label: {
                TitleView(title: title)
            }
        }
    }
    
    struct TitleView: View {
        var title: String
        
        var body: some View {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
            }
            .padding([.leading, .trailing], 16)
            .background(.yellow)
        }
    }
    
    struct DetailView: View {
        var body: some View {
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .center, spacing: 8) {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 50)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
