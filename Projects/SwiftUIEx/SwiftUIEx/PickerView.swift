//
//  PickerView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/27.
//

import SwiftUI

struct PickerView: View {
    var alignment: Alignment = .center
    var productList: [String]
    @State var selection = "Choose"
    
    init (alignment: Alignment = .center, _ productList: [String]) {
        self.alignment = alignment
        self.productList = productList
    }
    
    var body: some View {
        Menu {
            Picker("", selection: $selection) {
                ForEach(productList, id: \.self) {
                    Text($0)
                        .foregroundColor(.blue)
                }
            }
        } label: {
            CustomButton(selection)
                .alignment(alignment)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            PickerView(
                ["com 1", "com 2", "com 3", "com 4", "com 5", "com 6",
                 "com 7", "com 8", "com 9", "com 10", "com 11", "com 12"]
            )
        }
    }
}
