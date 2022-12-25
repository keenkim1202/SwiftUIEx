## 정수부, 소수부, 화폐 단위를 각각 다른 색깔/폰트 적용하는 방법
- AttributedString 을 활용하여 함수를 만들 수 있다.

```swift
import SwiftUI

struct ContentView: View {
    @State private var amount: Double = Double.random(in: 10...99999)
    @State private var date: Date = .now

    var body: some View {
        Text(customColorFormatString(amount))
    }

    private func customColorFormatString(_ amount: Double) -> AttributedString {
        var str: AttributedString = amount.formatted(.currency(code: Locale.current.currencyCode!).attributed)

        // Integer
        let integer = AttributeContainer.numberPart(.integer)
        let integerAttributes = AttributeContainer
            .foregroundColor(.primary)
            .font(.system(.headline, design: .rounded))
        str.replaceAttributes(integer, with: integerAttributes)

        // Fraction
        let fraction = AttributeContainer.numberPart(.fraction)
        let fractionAttributes = AttributeContainer
            .foregroundColor(.secondary)
            .font(.system(.footnote, design: .rounded))
        str.replaceAttributes(fraction, with: fractionAttributes)

        // Currency symbol
        let symbol = AttributeContainer.numberSymbol(.currency)
        let symbolAttributes = AttributeContainer
            .foregroundColor(.purple)
            .font(.caption)
            .baselineOffset(3)
        str.replaceAttributes(symbol, with: symbolAttributes)

        // Decimal separator
        let decimal = AttributeContainer.numberSymbol(.decimalSeparator)
        let decimalAttributes = AttributeContainer
            .foregroundColor(.secondary.opacity(0.5))
        str.replaceAttributes(decimal, with: decimalAttributes)

        // Grouping separator
        let grouping = AttributeContainer.numberSymbol(.groupingSeparator)
        let groupingAttributes = AttributeContainer
            .font(.body)
            .foregroundColor(.secondary)
        str.replaceAttributes(grouping, with: groupingAttributes)

        return str
    }
```
