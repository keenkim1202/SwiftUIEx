//
//  ContentView.swift
//  NavigationEx
//
//  Created by KeenKim on 2023/02/24.
//

import SwiftUI

func voidAction() {}

struct ContentView: View {
    // If this value is `false`, pop to root view.
    @State var isRootActive = false
    
    var body: some View {
        // `NavigationView` is a container that adds stack-based navigation to a view,
        // along with a (optional) navigation bar.
        NavigationView {
            VStack {
                Button(action: moveNext) {
                    Text("Content Button")
                }
                // `NavigationLink` can pushes a new view onto the navigation stack.
                NavigationLink(destination: FirstView(isRootActive: $isRootActive), isActive: $isRootActive) {
                    EmptyView()
                }
                Text("Content View's text")
            }
            .accentColor(.blue)
            .navigationTitle("Content")
            .navigationBarItems(leading: Image(systemName: "pencil"), trailing: Image(systemName: "book"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.red)
        .padding()
    }
    
    func moveNext() {
        isRootActive = true
    }
}

struct FirstView: View {
    var isRootActive: Binding<Bool>
    @State var isSecondViewActive = false
    
    var body: some View {
        VStack {
            Button(action: moveNext) {
                Text("First Button")
            }
            NavigationLink(destination: SecondView(isRootActive: isRootActive), isActive: $isSecondViewActive) {
                EmptyView()
            }
            Text("First View's text")
        }
        .accentColor(.yellow)
        .padding()
    }
    
    func moveNext() {
        isSecondViewActive = true
    }
}

struct SecondView: View {
    var isRootActive: Binding<Bool>
    
    var body: some View {
        VStack {
            Button(action: popToRoot) {
                Text("Second Button")
            }
            
            Text("Second View's text")
        }
        .accentColor(.green)
        .padding()
    }
    
    func popToRoot() {
        isRootActive.wrappedValue = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
