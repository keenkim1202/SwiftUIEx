// //
// //  TextEditVew.swift
// //  SwiftUIEx
// //
// //  Created by KeenKim on 2022/09/28.
// //
// 
// import SwiftUI
// 
// struct TextEditVew: View {
//     var price: Binding<Decimal>?
//     @State private var number = 0 as Decimal
// 
//     private var placeholderText: String?
//     
//     // init(number: Binding<Decimal>? = nil) {
//     //     self.number = number
//     // }
//     
//     var body: some View {
//         ZStack {
//             RoundedRectangle(cornerRadius: 8)
//                 .fill()
//                 .foregroundColor(.black)
//             RoundedRectangle(cornerRadius: 8)
//                 .strokeBorder(lineWidth: 1, antialiased: true)
//                 .foregroundColor(.secondary)
//             
//             VStack {
//                 if let price = price {
//                     TextField("", value: $number, format: .number)
//                         .font(.subheadline)
//                         .foregroundColor(.white)
//                         .multilineTextAlignment(.trailing).lineLimit(1)
//                         .padding(8)
//                 }
//                 else {
//                     Text(placeholderText ?? "")
//                         .font(.subheadline)
//                         .foregroundColor(.gray)
//                         .padding(8)
//                 }
//             }
//         }
//         .frame(height: 44)
//         .padding(8)
//         
//         HStack {
//             CustomButton("-5")
//                 .strokeColor(.black)
//                 .textColor(.black)
//                 .action {
//                     number = calcPercentage(percentage: -5)
//                 }
//             CustomButton("-1")
//                 .strokeColor(.black)
//                 .textColor(.black)
//                 .action {
//                     number = calcPercentage(percentage: -1)
//                 }
//             CustomButton("Reset")
//                 .strokeColor(.red)
//                 .textColor(.red)
//                 .action {
//                     number = price?.wrappedValue ?? .zero
//                 }
//             CustomButton("+1")
//                 .strokeColor(.black)
//                 .textColor(.black)
//                 .action {
//                     number = calcPercentage(percentage: 1)
//                 }
//             CustomButton("+5")
//                 .strokeColor(.black)
//                 .textColor(.black)
//                 .action {
//                     number = calcPercentage(percentage: 5)
//                 }
//         }
//     }
//     
//     func calcPercentage(percentage: Int) -> Decimal {
//         guard let originalPrice = price?.wrappedValue else { return .zero }
//         return number + (originalPrice * Decimal(integerLiteral: percentage) / 100)
//     }
// }
// 
// struct TextEditVew_Previews: PreviewProvider {
//     static var previews: some View {
//         DemoView()
//     }
//     
//     struct DemoView: View {
//         @State private var price = 111 as Decimal
//         
//         var body: some View {
//             VStack {
//                 TextEditVew(price: $price)
//                 // TextEditVew()
//             }
//         }
//     }
// }
