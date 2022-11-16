//
//  ContentView.swift
//  CustomSlider
//
//  Created by KeenKim on 2022/09/22.
//

import SwiftUI

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
