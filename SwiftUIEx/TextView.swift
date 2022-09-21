//
//  TextView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/20.
//

import SwiftUI

struct TextView: View {
    var textView: AnyView
    var color: Color
    
    init(text: String, color: Color) {
        self.color = color
        self.textView = AnyView(Text(text))
    }
    
    var body: some View {
        textView
            .background(color)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "hi", color: .blue)
    }
}
