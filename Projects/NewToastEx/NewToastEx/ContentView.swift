//
//  ContentView.swift
//  NewToastEx
//
//  Created by KeenKim on 2022/11/26.
//

import SwiftUI

struct ContentView: View {
    @State var isShow: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!\n width: \(UIScreen.main.bounds.width)\nheight: \(UIScreen.main.bounds.height)")
                .onTapGesture {
                    self.isShow = true
                }
        }
        .edgesIgnoringSafeArea(.all)
        .padding()
        .background(.green)
        .present(isPresented: $isShow, type: .toast, position: .top) {
            self.createTopToastView()
        }
    }
    
    func createTopToastView() -> some View {
        VStack {
            if UIDevice.current.hasNotch {
                Spacer(minLength: 40)
            } else {
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.yellow)
                    .frame(height: 40)
                
                VStack {
                    Text("It's toast Title!")
                        .foregroundColor(.red)
                    Text("It's toast Contents!")
                        .foregroundColor(.orange)
                }
            }
            .padding(16)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 3.5)
    }
}

// struct SomeCustomToastView: View {
//     var body: some View {
//
//     }
// }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// extension UIDevice {
//     var hasNotch: Bool {
//         let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
//         return bottom > 0
//     }
// }

extension UIDevice {
    /// Returns `true` if the device has a notch
    var hasNotch: Bool {
        guard
            #available(iOS 11.0, *),
            let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
        else { return false }
        
        if UIDevice.current.orientation.isPortrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
}
