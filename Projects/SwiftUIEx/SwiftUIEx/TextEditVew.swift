//
//  TextEditVew.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/28.
//

import SwiftUI

struct TextEditVew: View {
    var number: Binding<Decimal>?
    private var placeholderText: String?
    
    init(number: Binding<Decimal>? = nil) {
        self.number = number
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill()
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(lineWidth: 1, antialiased: true)
                .foregroundColor(.secondary)
            
            VStack {
                if let number = number {
                    TextField("", value: number, format: .number)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing).lineLimit(1)
                        .padding(8)
                }
                else {
                    Text(placeholderText ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(8)
                }
            }
        }
        .frame(height: 44)
        .padding(8)
        
        HStack {
            CustomButton("-5")
                .strokeColor(.black)
                .textColor(.black)
                .action {
                    print("clicked")
                    number?.wrappedValue = (number?.wrappedValue ?? 0) - 1
                }
            CustomButton("-1")
                .strokeColor(.black)
                .textColor(.black)
            CustomButton("Reset")
                .strokeColor(.red)
                .textColor(.red)
            CustomButton("+1")
                .strokeColor(.black)
                .textColor(.black)
            CustomButton("+5")
                .strokeColor(.black)
                .textColor(.black)
        }
    }
}

struct TextEditVew_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
    
    struct DemoView: View {
        @State private var demo = 111 as Decimal
        var body: some View {
            VStack {
                TextEditVew(number: $demo)
            }
        }
    }
}
