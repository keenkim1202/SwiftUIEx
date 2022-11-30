//
//  TextLengthEx.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/11/26.
//

import SwiftUI

struct TextLengthEx: View {
    @State var isShow: Bool = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Just Text")
                VStack(alignment: .leading) {
                    Text("Hi my name is Keen. Nice to meet you. Have a wonderful day!")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.red)
                    Text("Hi my name is Keen. Nice to meet you. Have a wonderful day!")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.orange)
                }
                .foregroundColor(.black)
                .padding(8)
                
                Text("Added Soft-Hyphen")
                VStack(alignment: .leading) {
                    Text("Hi my name is Keen. Nice to meet you. Have a wonderful \u{AD}day!")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.red)
                    Text("Hi my name is Keen. Nice to meet you. Have a \u{AD}wonderful day!")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.orange)
                }
                .foregroundColor(.black)
                .padding(8)
            }
            .padding(32)
            .background(.gray)
        }
    }
}

struct TextLengthEx_Previews: PreviewProvider {
    static var previews: some View {
        TextLengthEx()
    }
}
