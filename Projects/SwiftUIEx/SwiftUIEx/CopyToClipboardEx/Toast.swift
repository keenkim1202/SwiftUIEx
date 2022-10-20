//
//  Toast.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/10/21.
//

import UIKit
import SwiftUI

class Matrix {
    static let headerPrimarySize: CGFloat = 36
    static let headerSecondarySize: CGFloat = 27
    static let paragraphSize: CGFloat = 18
    static let stackViewSpacing: CGFloat = 20
    static let cornerRadius: CGFloat = 12
}

enum ToastType {
    case error(message: String)
    case success(message: String)
    case warning(message: String)
}

/// The alignment of toast. 'Top' or 'Bottom'.
enum ToastAlignment {
    case top
    case bottom
}

struct Toast<Presenting>: View where Presenting: View {
    /// The binding that decides the appropriate drawing in the body.
    @Binding var isShowing: Bool
    /// The view that will be "presenting" this toast.
    let presenting: () -> Presenting
    /// The text to show.
    let type: ToastType
    /// The toast will show during "timeInterval". default is 0.8.
    var timeInterval: TimeInterval
    
    var alignment: ToastAlignment = .bottom
    
    var backgroundColor: Color {
        switch type {
        case .error:
            return .red
        case .warning:
            return .yellow
        case .success:
            return .green
        }
    }
    
    var toastMessage: String {
        switch type {
        case .error(let message):
            return message
        case .warning(let message):
            return message
        case .success(let message):
            return message
        }
    }
    
    var toastImage: Image {
        switch type {
        case .error:
            return Image(systemName: "xmark.circle")
        case .warning:
            return Image(systemName: "exclamationmark.triangle")
        case .success:
            return Image(systemName: "checkmark.circle")
        }
    }
    
    var body: some View {
        if self.isShowing {
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
                withAnimation {
                    self.isShowing = false
                }
            }
        }
        
        return ZStack {
            self.presenting()
            
            GeometryReader { geometry in
                
                if alignment == .bottom {
                    ToastView(image: self.toastImage, message: self.toastMessage, isShowing: self.isShowing)
                        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).maxY - 24)
                } else {
                    ToastView(image: self.toastImage, message: self.toastMessage, isShowing: self.isShowing)
                        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).minY + 24)
                }
            }
        }
    }
    
    private struct ToastView: View {
        var image: Image
        var message: String
        var isShowing: Bool
        
        var body: some View {
            HStack(spacing: 8) {
                image
                Text(message)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding([.top,.bottom], 16)
            }
            .padding([.leading,.trailing], 16)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.95)
            .fixedSize()
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(Capsule())
            .opacity(isShowing ? 1 : 0)
        }
    }
}

extension View {
    /// Use 'toast()' outermost hierarcy view. It will add ZStack on outermost view then draw the toast bottom of the screen. (or top)
    func toast(isShowing: Binding<Bool>, type: ToastType, during: TimeInterval = 0.8, alignment: ToastAlignment = .bottom) -> some View {
        Toast(isShowing: isShowing,presenting: { self }, type: type, timeInterval: during, alignment: alignment)
    }
}

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
    
    struct DemoView: View {
        @State var isShowingTopToast: Bool = false
        @State var isShowingBottomToast: Bool = false
        
        var body: some View {
            VStack {
                Text("click to show 'top' toast on view")
                    .background(.green)
                    .onTapGesture {
                        self.isShowingTopToast.toggle()
                    }
                Text("click to show 'bottom' toast on view")
                    .background(.red)
                    .onTapGesture {
                        self.isShowingBottomToast.toggle()
                    }
            }
            .toast(isShowing: $isShowingTopToast, type: .success(message: "toast on top!"), alignment: .top)
            .toast(isShowing: $isShowingBottomToast, type: .success(message: "toast on bottom!"))
        }
    }
}
