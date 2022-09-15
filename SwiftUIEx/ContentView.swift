//
//  ContentView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // ZStack {
        //     EmptyView() // 빈 뷰 추가
        //         .foregroundColor(.white)
        //
        //     VStack {
        //         Image(systemName: "globe")
        //             .imageScale(.large) // 이미지 크기
        //             .foregroundColor(.accentColor) // 이미지 tintColor
        //         Text("Hello, world!")
        //             .foregroundColor(.blue) // tintColor 지정
        //     }
        //     .background(Color.white) // 배경색 지정
        //     .padding() // default: 20
        // }
        
        VStack {
            Image.init(systemName: "person.fill")
                .resizable()
                .frame(width: 24, height: 24)
            Text("this is test text..")
        }
        .background(.red)
        .padding([.top, .bottom], 10)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.red, lineWidth: 1.0)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
