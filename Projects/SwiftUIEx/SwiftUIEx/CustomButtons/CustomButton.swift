//
//  CustomButton.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/28.
//

import SwiftUI

struct CustomButton: View {
    private var action = noop
    var alignment: Alignment = .center
    var text: String
    var iconName: String?
    var textColor: Color = .blue
    var strokeColor: Color = .blue
    
    init(_ text: String = "", alignment: Alignment = .center, iconName: String? = nil, action: @escaping () -> Void = noop) {
        self.text = text
        self.alignment = alignment
        self.iconName = iconName
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: alignment) {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder()
                    .foregroundColor(strokeColor)
                HStack {
                    Spacer()
                    if let iconName = iconName {
                        Image(systemName: iconName).padding(8)
                    }
                }
                
                Text(text)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(.subheadline)
                    .foregroundColor(textColor)
                    .padding(8)
            }
            .padding([.leading, .trailing], 16)
            .frame(height: 36)
        }
    }
}

extension CustomButton {
    func alignment(_ alignment: Alignment) -> Self {
        var copy = self
        copy.alignment = alignment
        return copy
    }
    
    func strokeColor(_ color: Color) -> Self {
        var copy = self
        copy.strokeColor = color
        return copy
    }
    
    func textColor(_ color: Color) -> Self {
        var copy = self
        copy.textColor = color
        return copy
    }
    
    func action(_ action: @escaping () -> Void) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(iconName: "arrow.down.circle")
    }
}
