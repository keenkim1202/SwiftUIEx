//
//  ContentView2.swift
//  TextCountLimitEx
//
//  Created by KeenKim on 2023/01/19.
//

import SwiftUI
import Combine

struct ContentView2: View {
    @State var text: String = ""
    @State var intPart: String = ""
    @State var fractionPart: String = ""
    let fractionlength: Int = 4
    
    var body: some View {
        VStack {
            Text("integer part: \(intPart.isEmpty ? "empty" : intPart)")
                .foregroundColor(.black)
            Text("fractional part: \(fractionPart.isEmpty ? "empty" : fractionPart)")
                .foregroundColor(.black)
            
            TextField("write some text", text: $text)
                .onReceive(Just(text)) { _ in
                    let decimalSplit = text.components(separatedBy: ".")
                    
                    if let integerPart = decimalSplit.first,
                       let fractionalPart = decimalSplit.last {
                        if fractionalPart.count >= fractionlength {
                            text = String(text.prefix(integerPart.count + fractionlength + 1))
                        }
                    }
                }
                .background(.orange)
        }
        .padding()
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
    
    struct DemoView: View {
        @State var text: String = ""
        
        var body: some View {
            ContentView2(text: text)
        }
    }
}
