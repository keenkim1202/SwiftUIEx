//
//  TestNaviView.swift
//  WebviewEx
//
//  Created by KeenKim on 2022/10/17.
//

import SwiftUI

struct TestNaviView: View {
    var body: some View {
        NavigationView {
            Text("SwiftUI")
                .navigationTitle("Welcome") // navi title
                .navigationBarTitleDisplayMode(.inline) // uikit default navigationbar style
                .toolbar { // barbuttonItem
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Leading") {
                            print("Leading tapped!")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Trailing") {
                            print("Trailing tapped!")
                        }
                    }
                    ToolbarItemGroup(placement: .bottomBar) { // <-
                        Button("First") {
                            print("tap first button")
                        }
                        .background(.green)
                        .foregroundColor(.black)
                        Button("Second") {
                            print("tap second button")
                        }
                        .background(.red)
                        .foregroundColor(.black)
                    }
                }
        }
    }
}

struct TestNaviView_Previews: PreviewProvider {
    static var previews: some View {
        TestNaviView()
    }
}
