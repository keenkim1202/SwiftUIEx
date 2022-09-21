//
//  HorizontalLabelView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/20.
//

import SwiftUI

struct HorizontalLabelView: View {
    var label: AnyView
    var content: AnyView
    
    init(label: String, content: String) {
        self.label = AnyView(Text(label))
        self.content = AnyView(Text(content))
    }
    
    var body: some View {
        HStack {
            label
            Spacer()
            content
        }
    }
}
struct HorizontalLabelViewXCP: PreviewProvider {
    static var previews: some View {
        DemoView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
    struct DemoView: View {
        var body: some View {
            VStack {
                HorizontalLabelView(label: "Position", content: "test11")
                    .font(
                        Font.system(size: 12, weight: .medium, design: .default)
                    )
                    .foregroundColor(.blue)
                HorizontalLabelView(label: "Position", content: "test22")
                    .font(
                        Font.system(size: 12, weight: .medium, design: .default)
                    )
                    .foregroundColor(.blue)
                HorizontalLabelView(label: "Position", content: "test33")
                    .font(
                        Font.system(size: 12, weight: .medium, design: .default)
                    )
                    .foregroundColor(.blue)
            }
        }
    }
}
