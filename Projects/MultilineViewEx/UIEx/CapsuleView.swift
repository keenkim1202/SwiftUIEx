//
//  UIExApp.swift
//  UIEx
//
//  Created by KeenKim on 2023/07/10.
//

import SwiftUI

struct CapsuleView: View {
    var label: AnyView
    var strokeColor: Color = .black
    
    init(label: String) {
        self.label = AnyView(Text(label))
    }
    init<Label: View>(@ViewBuilder label: () -> Label) {
        self.label = AnyView(label())
    }
    
    var body: some View {
        ZStack() {
            Capsule()
                .stroke()
                .foregroundColor(strokeColor)
            HStack(spacing: 3.5) {
                label
                    .font(.caption)
            }
            .foregroundColor(strokeColor)
            .padding(EdgeInsets(top: 2, leading: 12, bottom: 2, trailing: 12))
            .frame(height: 18)
        }
        .fixedSize()
    }
    
    func strokeColor(_ color: Color) -> Self {
        var copy = self
        copy.strokeColor = color
        return copy
    }
}
