//
//  ContentView3.swift
//  TextCountLimitEx
//
//  Created by KeenKim on 2023/01/19.
//

import SwiftUI
import Combine

struct ContentView3: View {
    @State var text: String = ""
    @State var intPart: String = ""
    @State var fractionPart: String = ""
    let fractionlength: Int = 4
    @State var viewModel = ViewModel()
    @State var arrayCount: Int = 0
    
    
    var body: some View {
        VStack {
            Text("integer part: \(intPart.isEmpty ? "empty" : intPart)")
                .foregroundColor(.black)
            Text("fractional part: \(fractionPart.isEmpty ? "empty" : fractionPart)")
                .foregroundColor(.black)
            Text("splited array count: \(arrayCount)")
            TextField("write some text", text: $text)
                .onReceive(Just(text)) { _ in
                    if text.filter({ $0 == "." }).count > 1 {
                        text.removeLast()
                        return
                    }
                    
                    let decimalSplit = text.components(separatedBy: ".")
                    arrayCount = decimalSplit.count
                    
                    if arrayCount == 2 {
                        if let integerPart = decimalSplit.first,
                           let fractionalPart = decimalSplit.last {
                            intPart = integerPart
                            fractionPart = fractionalPart
                            
                            if fractionalPart.count >= fractionlength {
                                text = String(text.prefix(integerPart.count + fractionlength + 1))
                            }
                        }
                    }
                }
                .background(.orange)
            
            TextField("write some text", text: Binding<String>(get: {
                viewModel.someText
            }, set: { newText in
                viewModel.someText = newText
            }))
            
            Text("number: \(viewModel.someText.isEmpty ? "empty" : viewModel.someText)")
        }
        .padding()
    }
    
    final class ViewModel: ObservableObject {
        private var numberText: String = ""
        private var fractionLength: Int = 0
        
        var someText: String {
            get {
                numberText
            }
            set {
                numberText = numberFormattedString(newValue, fractionLength) // some formatting
            }
        }
        
        func numberFormattedString(_ text: String, _ fractionLength: Int) -> String {
            let numberFormatter = NumberFormatter() //NumberFormatter 객체 생성
            numberFormatter.maximumFractionDigits = fractionLength
            return numberFormatter.string(for: text) ?? ""
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
