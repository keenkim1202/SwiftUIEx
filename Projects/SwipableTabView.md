
## Video

https://github.com/keenkim1202/SwiftUIEx/assets/59866819/5d7ed557-16f2-4ce8-a478-539f7b9e3a38


## Code

```swift
import SwiftUI

struct TestView: View {
    @State var currentTab: Int = 0
    @Namespace var namespace
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$currentTab, content: {
                FirstView().tag(0)
                SecondView().tag(1)
                ThirdView().tag(2)
                FourthView().tag(3)
                FifthView().tag(4)
            })
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
            tabView
        }
    }
    
    var tabItems: [String] = ["First tab", "Second tab", "Third tab", "Fourth tab", "Fifth tab"]
    
    var tabView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabItems.indices, self.tabItems)), id: \.0, content: {
                    index, name in
                    tabItem(string: name, tab: index)
                })
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
        .background(Color.white)
        .frame(height: 80)
        .edgesIgnoringSafeArea(.top)
    }
    
    
    func tabItem(string: String, tab: Int) -> some View {
        Button {
                self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                if self.currentTab == tab {
                    Text(string)
                        .font(.system(size: 13, weight: .bold, design: .default))
                    Color.black.frame(height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Text(string)
                        .font(.system(size: 13, weight: .bold, design: .default))
                        .foregroundStyle(Color.gray)
                    Color.clear.frame(height: 2)
                }
            }.animation(.spring(), value: currentTab)
        }
        .buttonStyle(.plain)
    }

    // Tab View
    private struct FirstView: View {
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundStyle(.red)
                Text("First Tab View")
            }
        }
    }
    
    private struct SecondView: View {
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundStyle(.orange)
                Text("Second Tab View")
            }
        }
    }
    
    private struct ThirdView: View {
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundStyle(.yellow)
                Text("Third Tab View")
            }
        }
    }
    
    private struct FourthView: View {
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundStyle(.green)
                Text("Fourth Tab View")
            }
        }
    }
    
    private struct FifthView: View {
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundStyle(.blue)
                Text("Fifth Tab View")
            }
        }
    }
}
```
