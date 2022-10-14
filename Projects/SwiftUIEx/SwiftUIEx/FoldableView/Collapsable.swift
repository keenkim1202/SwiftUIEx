//
//  Collapsable.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/14.
//

import SwiftUI

struct Collapsible<Content: View>: View {
    @State var label: () -> Text
    @State var content: () -> Content
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack {
            Button(
                action: {
                    self.collapsed.toggle()
                },
                label: {
                    HStack {
                        self.label()
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut, value: collapsed)
            .transition(.slide)
        }
    }
}

struct CollapsibleView<Content: View>: View {
    @State var titleView: () -> Content
    @State var content: () -> Content
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack {
            Button(
                action: {
                    self.collapsed.toggle()
                },
                label: {
                    HStack {
                        self.titleView()
                        Spacer()
                        Image(systemName: self.collapsed ? "arrowtriangle.down.circle" : "arrowtriangle.down.circle")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut, value: collapsed)
            .transition(.slide)
        }
    }
}

struct Collapsible_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Collapsible(
                label: {
                    Text("Collapsible")
                },
                content: {
                    HStack {
                        Text("Content")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.secondary)
                }
            )
            .frame(maxWidth: .infinity)
            .padding(16)
        }
        
        CollapsibleView {
            HStack {
                Text("title")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.secondary)
        } content: {
            HStack {
                Text("Content")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.secondary)
        }
    }
}
