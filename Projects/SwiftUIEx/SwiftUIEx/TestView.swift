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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(.green)
            Image(systemName: "")
                .background(.yellow)
            Image(systemName: "star.fill")
                .background(.red)
            let _ = print(Image(systemName: ""), Image(systemName: "star.fill"))
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
