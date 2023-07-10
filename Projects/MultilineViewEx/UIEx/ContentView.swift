//
//  UIExApp.swift
//  UIEx
//
//  Created by KeenKim on 2023/07/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TestView(
                items: [FirstInfoView(number: "123456789123456789", text: "LongInfo"),
                        TagView(tag1: "tag 1", tag2: "tag 2", isChecked: true)],
                isChecked: true)
            
            TestView(
                items: [FirstInfoView(number: "123", text: "ShortInfo"),
                        TagView(tag1: "tag 3", tag2: "tag 4", isChecked: false)],
                isChecked: false)
        }
    }
}

struct FirstInfoView: View {
    var number: String
    var text: String
    
    var body: some View {
        Text("\(number) \(text)")
            .font(.headline)
    }
}

struct TagView: View {
    var tag1: String
    var tag2: String
    var isChecked: Bool
    
    var body: some View {
        HStack {
            let color: Color = isChecked ? .green : .red
            CapsuleView(label: tag1).strokeColor(color)
            CapsuleView(label: tag2).strokeColor(color)
        }
    }
}

struct TestView: View {
    @State var items: [any View]
    var isChecked: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                VerticalFlow(items: $items) { item in
                    AnyView(item)
                }
                
                Text("This is description area.")
            }
            .frame(maxWidth: .infinity)
            .background(.yellow)
            
            Image(systemName: isChecked ? "checkmark.circle.fill" : "x.circle.fill")
                .imageScale(.medium)
                .foregroundColor(isChecked ? .green : .red)
        }
        .padding()
        .background(.black)
    }
}

/// FirstInfoView + TagView 가 한 줄로 처리되지 않을 경우, TagView를 아랫줄로 내림
struct VerticalFlow<Item, ItemView: View>: View {
    @Binding var items: [Item]
    @State private var size: CGSize = .zero
    @ViewBuilder var itemViewBuilder: (Item) -> ItemView
    
    var hSpacing: CGFloat = 8
    var vSpacing: CGFloat = 8
    
    var body: some View {
        var width: CGFloat = .zero
        var height: CGFloat = .zero
        
        VStack {
            GeometryReader { geometryProxy in
                ZStack(alignment: .topLeading) {
                    ForEach(items.indices, id: \.self) { i in
                        itemViewBuilder(items[i])
                            .alignmentGuide(.leading) { dimensions in
                                if abs(width - dimensions.width) > geometryProxy.size.width {
                                    width = 0
                                    height -= dimensions.height + vSpacing
                                }
                                
                                let leadingOffset = width
                                if i == items.count - 1 {
                                    width = 0
                                }
                                else {
                                    width -= dimensions.width + hSpacing
                                }
                                
                                return leadingOffset
                            }
                            .alignmentGuide(.top) { dimensions in
                                let topOffset = height
                                if i == items.count - 1 {
                                    height = 0
                                }
                                
                                return topOffset
                            }
                    }
                }
                .readVerticalFlowSize(to: $size)
            }
        }
        .frame(height: size.height > 0 ? size.height : nil)
    }
}

private extension View {
    func readVerticalFlowSize(to size: Binding<CGSize>) -> some View {
        background(GeometryReader { proxy in
            Color.clear.preference(
                key: VerticalFlowSizePreferenceKey.self,
                value: proxy.size
            )
        })
        .onPreferenceChange(VerticalFlowSizePreferenceKey.self) {
            size.wrappedValue = $0
        }
    }
}

private struct VerticalFlowSizePreferenceKey: PreferenceKey {
    static let defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        let next = nextValue()
        if next != .zero {
            value = next
        }
    }
}

struct TagItemView: View {
    var tag: Tag
    
    var body: some View {
        if tag.isCapsule {
            CapsuleView(label: tag.text)
                .strokeColor(tag.textColor)
        }
        else {
            Text(tag.text)
                .fixedSize()
                .foregroundColor(tag.textColor)
                .font(tag.font)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
