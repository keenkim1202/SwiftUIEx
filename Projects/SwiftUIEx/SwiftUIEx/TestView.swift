//
//  TestView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/25.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            Button {
                print("clicked")
            } label: {
                Text("Button")
                    .foregroundColor(.white)
            }
            .buttonStyle(StaticButtonStyle())
            .background(.black)

        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
    }
}
