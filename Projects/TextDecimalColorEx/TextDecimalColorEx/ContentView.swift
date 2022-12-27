//
//  ContentView.swift
//  TextDecimalColorEx
//
//  Created by KeenKim on 2022/12/25.
//

import SwiftUI

struct ContentView: View {
    var decimalNumber: Decimal = 10.11
    var fractionSize: Int = 3
    var decimalString: String = "10.11"
    var body: some View {
        VStack(alignment: .leading) {
            Text("pretty: \(pretty(decimalNumber))")
        }
        .padding()
    }
    
    private func pretty(_ amount: Decimal) -> AttributedString {
        var str: AttributedString = amount.formatted(.number.attributed)
        
        // Integer
        let integer = AttributeContainer.numberPart(.integer)
        let integerAttributes = AttributeContainer
            .foregroundColor(.primary)
            .font(.system(size: 14, weight: .bold))
        str.replaceAttributes(integer, with: integerAttributes)
        
        // Decimal separator
        let decimal = AttributeContainer.numberSymbol(.decimalSeparator)
        let decimalAttributes = AttributeContainer
            .foregroundColor(.primary)
            .font(.system(size: 14, weight: .bold))
        str.replaceAttributes(decimal, with: decimalAttributes)
        
        // Fraction
        let fraction = AttributeContainer.numberPart(.fraction)
        let fractionAttributes = AttributeContainer
            .foregroundColor(.secondary)
            .font(.system(size: 14, weight: .bold))
        str.replaceAttributes(fraction, with: fractionAttributes)
        
        return str
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
