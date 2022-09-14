//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by 김혜진 on 2022/09/14.
//

import SwiftUI

/*
 SwiftUI의 뷰 파일은 두 가지 구조체를 선언.
 1.
 View 프로토콜을 준수하며 뷰의 컨텐츠나 레이아웃을 묘사
 
 2.
 1에서 작성한 해당 뷰에 대한 Preview를 선언.
 
 오른쪽 canvas의 요소를 누르면 나오는 SwiftUI Inspector를 통해 속성을 변경해줄 수 있음.
 변경 사항은 바로바로 코드에 반영됨.
 
 View를 커스텀하려면 modifiers 메서드를 호출해야 함.
 -> 뷰를 랩핑하여 디스플레이나 다른 속성들을 바꿔줌
 
 각 modifiers는 새로운 View를 반환 -> 여러 modifier를 수직으로 쌓듣이 연결하는 것이 일반적임.
 (ex. .font(.body), .fontWeight(.medium) ... )
 */

/*
 스택의 종류는 3가지
 - HStack : Horizontal StackView 랑 비슷
 - VStack : Vertical StackView 랑 비슷
 - ZStack : addSubview 하듯 제일 상위 뷰에 스택을 쌓는 느낌
 (preview에서도 추가 가능)
 */

struct ContentView: View {
    var body: some View {
//        ZStack {
//            EmptyView() // 빈 뷰 추가
//                .foregroundColor(.white)
//
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large) // 이미지 크기
//                    .foregroundColor(.accentColor) // 이미지 tintColor
//                Text("Hello, world!")
//                    .foregroundColor(.blue) // tintColor 지정
//            }
//            .background(Color.white) // 배경색 지정
//            .padding() // default: 20
//        }
        
        VStack {
           Image.init(systemName: "person.fill")
            .resizable()
            .frame(width: 24, height: 24)
           Text("this is test text..")
          }
        .background(.red)
          .padding([.top, .bottom], 10)
          .overlay(RoundedRectangle(cornerRadius: 16)
           .stroke(Color.red, lineWidth: 1.0)
          )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
