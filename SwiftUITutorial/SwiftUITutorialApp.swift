//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by 김혜진 on 2022/09/14.
//

import SwiftUI

/*
 SwiftUI app life-cycle을 사용하는 앱은 App 프로토콜을 준수해야함.
 body 프로퍼티는 하나 이상의 scene을 반환.
 @main : 앱의 진입점을 가리키는 attribute identifier
 */
@main
struct SwiftUITutorialApp: App { // APP : A type that represents the structure and behavior of an app.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
