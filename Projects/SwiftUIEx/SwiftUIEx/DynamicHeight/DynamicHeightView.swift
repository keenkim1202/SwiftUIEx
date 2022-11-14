//
//  DynamicHeightView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/11/05.
//

import SwiftUI

struct DynamicHeightView: View {
    @State var items: [String] = ["hi", "hello", "my", "name", "is", "keen"]
    var body: some View {
        VerticalFlow(items: $items) { item in
            Text(item)
                .background(.yellow)
        }
        
        .background(.red)
    }
}

struct DynamicHeightView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicHeightView()
    }
}

// --------------------------------------------------------- //
struct VerticalFlow<Item, ItemView: View>: View {
    @Binding var items: [Item]
    var hSpacing: CGFloat = 20
    var vSpacing: CGFloat = 10
    @ViewBuilder var itemViewBuilder: (Item) -> ItemView
    @State private var size: CGSize = .zero
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
                                } else {
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

struct VerticalFlow_Previews: PreviewProvider {
    @SwiftUI.State static var items: [String] = [
        "One 1", "Two 2", "Three 3", "Four 4", "Eleven 5", "Six 6",
        "Seven 7", "Eight 8", "Nine 9", "Ten 10", "Eleven 11",
        "ASDFGHJKLqwertyyuio d fadsf",
        "Poiuytrewq lkjhgfdsa mnbvcxzI 0987654321"
    ]
    static var previews: some View {
        VStack {
            Text("Text at the top")
            VerticalFlow(items: $items) { item in
                VerticalFlowItem(systemImage: "pencil.circle", title: item, isSelected: true)
            }
            Text("Text at the bottom")
        }
        ScrollView {
            VStack {
                Text("Text at the top")
                VerticalFlow(items: $items) { item in
                    VerticalFlowItem(systemImage: "pencil.circle", title: item, isSelected: true)
                }
                Text("Text at the bottom")
            }
        }
    }
}

private struct VerticalFlowItem: View {
    let systemImage: String
    let title: String
    @SwiftUI.State var isSelected: Bool
    var body: some View {
        HStack {
            Image(systemName: systemImage).font(.title3)
            Text(title).font(.title3).lineLimit(1)
        }
        .padding(10)
        .foregroundColor(isSelected ? .white : .blue)
        .background(isSelected ? Color.blue : Color.white)
        .cornerRadius(40)
        .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.blue, lineWidth: 1.5))
        .onTapGesture {
            isSelected.toggle()
        }
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
