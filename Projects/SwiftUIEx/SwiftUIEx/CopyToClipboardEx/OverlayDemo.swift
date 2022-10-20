//
//  OverlayDemo.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/21.
//

import SwiftUI

struct OverlayDemo: View {
    @State private var showOverlay = false
    var body: some View {
        Text("Hello, World!").overlay(overlayView: Text("OverlyText").background(Color.red).onTapGesture {
            withAnimation {
                showOverlay.toggle()
            }
        }, show: $showOverlay)
        .onTapGesture {
            withAnimation {
                showOverlay = true
            }
        }
    }
}

struct Overlay<T: View>: ViewModifier {
    
    @Binding var show:Bool
    let overlayView: T
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                overlayView
            }
        }
    }
}

extension View {
    func overlay<T: View>( overlayView: T, show: Binding<Bool>) -> some View {
        self.modifier(Overlay.init(show: show, overlayView: overlayView))
    }
}

struct OverlayDemo_Previews: PreviewProvider {
    static var previews: some View {
        OverlayDemo()
    }
}
