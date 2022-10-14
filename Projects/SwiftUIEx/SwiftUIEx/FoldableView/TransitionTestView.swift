//
//  TransitionTestView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/15.
//

import SwiftUI

struct TransitionTestView: View {
    @State private var isCollapsed: Bool = false
    
    var body: some View {
        // fordable을 smooth하게 해주고싶다면 offset으로 조정해보기
        // frame의 사이즈를 줄였다 만드는 방식으로 하면 실시간으로 변화하는 값의 경우 원하지 않는 위치에서 생성되었다가 옮겨질 수 있다.
        HStack {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    Text("")
                        .frame(width: 100, height: 44)
                    Text("front text")
                        .frame(width: 100, height: 44)
                        .background(.yellow)
                }
                .offset(y: isCollapsed ? 0 : -44)
                .animation(.easeInOut, value: isCollapsed)
                
                Text("behind text")
                    .frame(width: 100, height: 44)
                    .background(.red)
            }
            Button(isCollapsed ? "close" : "open") {
                isCollapsed.toggle()
            }
        }
    }
}

struct TransitionTestView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionTestView()
    }
}
