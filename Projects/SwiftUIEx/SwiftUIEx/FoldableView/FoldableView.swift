//
//  FoldableView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/14.
//

import SwiftUI

struct FoldableView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Title stirng....")
                Spacer()
            }
            .padding(.bottom)
            
            Divider()
                .padding(.bottom)
            
            CollapsibleView {
                InnerView(text: "its title", backgroundColor: .yellow)
            } content: {
                InnerView(text: "its content", backgroundColor: .green)
            }
            
            Spacer()
        }
    }
}

struct InnerView: View {
    var text: String?
    var backgroundColor: Color?
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(text ?? "no text..")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(backgroundColor)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct FoldableView_Previews: PreviewProvider {
    static var previews: some View {
        FoldableView()
    }
}
