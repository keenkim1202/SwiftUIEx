//
//  ContentView.swift
//  JSONDecodeEx
//
//  Created by KeenKim on 2023/04/12.
//

import SwiftUI

struct TestModel: Decodable {
    var name: String
    var introduction: String
}

struct ContentView: View {
    var testData: TestModel = loadJson("testData.json")
    
    var body: some View {
        VStack {
            Text(testData.name)
            Text(testData.introduction)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
