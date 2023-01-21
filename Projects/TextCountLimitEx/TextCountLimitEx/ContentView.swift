//
//  ContentView.swift
//  TextCountLimitEx
//
//  Created by KeenKim on 2023/01/19.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            TextField("write some text", text: $text.max(8))
                .background(.yellow)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
    
    struct DemoView: View {
        @State var text: String = ""
        
        var body: some View {
            ContentView(text: text)
        }
    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}
