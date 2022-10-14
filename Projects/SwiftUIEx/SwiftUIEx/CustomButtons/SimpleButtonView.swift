//
//  SimpleButtonView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/12.
//

import SwiftUI
import UIKit

struct SimpleButton<Content: View>: View {
    var action = noop as () -> Void
    var content: Content
    init(_ content: Content) {
        self.content = content
    }
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    init(action: @escaping () -> Void, content: Content) {
        self.action = action
        self.content = content
    }
    var body: some View {
        Button(action: action) {
            content
        }
    }
    func action(_ x: @escaping () -> Void) -> SimpleButton {
        var copy = self
        copy.action = x
        return copy
    }
}

#if DEBUG
struct  SimpleButtonXCP: PreviewProvider {
    static var previews: some View {
        DemoView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
    struct DemoView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                SimpleButton {
                    Text("This is Button")
                }
            }
            .padding(50)
        }
    }
}
#endif
