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
            VStack {
                VStack(alignment: .leading) {
                    Text("You can deposit from an external ETH wallet to this ETH deposit address or QR code.")
                        .font(.system(size: 14))
                        .background(.red)
                    Text("You should deposit ETH using the Ethereum network.")
                        .font(.system(size: 14, weight: .bold))
                        .background(.orange)
                    Text("You should deposit ETH using the Ethereum networ")
                        .font(.system(size: 14, weight: .bold))
                        .background(.green)
                    Text("You should deposit ETH using the Ethereum network.")
                        .font(.system(size: 14, weight: .bold))
                        .minimumScaleFactor(0.01)
                        .lineLimit(2)
                        .background(.blue)
                    Text("You should deposit ETH using the Ethereum network. test longer text")
                        .font(.system(size: 14, weight: .bold))
                        .minimumScaleFactor(0.01)
                        .lineLimit(2)
                        .frame(width: UIScreen.main.bounds.width - 16, alignment: .leading)
                        .background(.purple)
                }
                .background(.white)
            }
            .background(.gray)
            .padding(16)
        }
    }
}

struct TextLengthEx_Previews: PreviewProvider {
    static var previews: some View {
        TextLengthEx()
    }
}
