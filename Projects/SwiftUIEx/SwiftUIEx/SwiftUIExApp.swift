//
//  SwiftUIExApp.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/15.
//

import SwiftUI

/*
 SwiftUI app life-cycle을 사용하는 앱은 App 프로토콜을 준수해야함.
 body 프로퍼티는 하나 이상의 scene을 반환.
 @main : 앱의 진입점을 가리키는 attribute identifier
 */
@main
struct SwiftUIExApp: App { // APP : A type that represents the structure and behavior of an app.
    var body: some Scene {
        WindowGroup {
            // ContentView()
            // PickerView(["A", "B", "C"])
            // TextEditVew()
            // CopyTextView()
            // CopyClipboardEx()
            // HalfSheetView()
            // HalfSheet {
            //     ScrollView {
            //         VStack {
            //             Text("hi 1")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .background(.red)
            //             Text("hi 2")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .background(.orange)
            //             Text("hi 3")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .background(.yellow)
            //             Text("hi 4")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .background(.green)
            //             Text("hi 5")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .background(.blue)
            //             Text("hi 6")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .background(.purple)
            //             Text("hi 7")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .foregroundColor(.white)
            //                 .background(.black)
            //             Text("hi 8")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .foregroundColor(.white)
            //                 .background(.gray)
            //             Text("hi 9")
            //                 .font(.system(size: 15))
            //                 .frame(height: 50)
            //                 .foregroundColor(.white)
            //                 .background(.brown)
            //         }
            //         .background(.yellow)
            //     }
            // }
            TestView()
            
        }
    }
}
