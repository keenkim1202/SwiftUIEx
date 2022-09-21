//
//  ContentView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/15.
//

import SwiftUI

// https://www.youtube.com/watch?v=z0PqbaHHjfA

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            SliderView()
            Spacer()
        }
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
