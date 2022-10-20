//
//  CopyClipboardEx.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/21.
//

import SwiftUI

struct CopyClipboardEx: View {
    @State var text: String = ""
    @State var copiedText: String = "hellotest"
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill()
                    .foregroundColor(.blue)
                Text(copiedText)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding(16)
            }
            .padding(16)
            .fixedSize(horizontal: false, vertical: true)
            .onTapGesture {
                UIPasteboard.general.string = copiedText // copy to pastboard
            }
            
            TextField("paste text here.", text: $text)
                .padding(16)
                .frame(height: 50)
                .background(Color(uiColor: .secondarySystemBackground))
                .padding(16)
        }
    }
}

struct CopyClipboardEx_Previews: PreviewProvider {
    static var previews: some View {
        CopyClipboardEx()
    }
}
