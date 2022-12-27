//
//  ContentView.swift
//  CustomSegmentPickerEx
//
//  Created by KeenKim on 2022/12/25.
//

import SwiftUI

// struct ContentView: View {
//     @State var preselectedIndex = 0
//
//     var body: some View {
//         VStack {
//             Text("Hello, world!")
//             CustomSegmentedControl(preselectedIndex: $preselectedIndex, options: ["Apple", "Banana", "Car"])
//         }
//         .padding()
//     }
//
//     struct CustomSegmentedControl: View {
//         @Binding var preselectedIndex: Int
//         var options: [String]
//         let color = Color.blue
//         let selectedItemWidth: CGFloat = 40
//
//         var body: some View {
//             HStack(spacing: 0) {
//                 ForEach(options.indices, id:\.self) { index in
//                     let isSelected = preselectedIndex == index
//                     ZStack {
//                         Rectangle()
//                             .fill(.gray)
//                         // .fill(color.opacity(0.2))
//
//                         Rectangle()
//                             .fill(color)
//                             .cornerRadius(20)
//                             .padding(2)
//                             .opacity(isSelected ? 1 : 0.01)
//                             .onTapGesture {
//                                 withAnimation(.interactiveSpring(response: 0.2, dampingFraction: 2, blendDuration: 0.5)) {
//                                     preselectedIndex = index
//                                 }
//                             }
//                     }
//                     .overlay(
//                         Text(options[index])
//                             .fontWeight(.bold)
//                             .foregroundColor(isSelected ? .black : .white)
//                     )
//                 }
//             }
//             .frame(height: selectedItemWidth)
//             .cornerRadius(20)
//         }
//     }
// }
//
// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ContentView()
//     }
// }

// struct ContentView: View {
//     @State private var favoriteColor = 0
//
//         var body: some View {
//             VStack {
//                 Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
//                     Text("Red").font(.title).tag(0)
//                     Text("Green").font(.title2).tag(1)
//                     Text("Blue").font(.title3).tag(2)
//                 }.pickerStyle(SegmentedPickerStyle())
//
//                 Text("Value: \(favoriteColor)")
//             }
//         }
// }
//
// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ContentView()
//     }
// }

struct ContentView: View {
    @State private var favoriteColor = 0

        var body: some View {
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: 110, height: 30)
                    .foregroundColor(.green)
                HStack {
                    Circle()
                        .frame(width: 24, height: 24)
                        .padding(3)
                        .foregroundColor(.white)
                    Text("Take Profit")
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
