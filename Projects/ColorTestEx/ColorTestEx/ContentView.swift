//
//  ContentView.swift
//  ColorTestEx
//
//  Created by KeenKim on 2023/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color(UIColor(white: 0, alpha: 0.25)))
            VStack {
                Text("Hello, world!")
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1, darkRed: CGFloat, darkGreen: CGFloat, darkBlue: CGFloat, darkAlpha: CGFloat = 1) {
        if #available(iOS 13.0, *) {
            self.init { (traits) -> UIColor in
                switch traits.userInterfaceStyle {
                    case .dark:
                        return UIColor(red: darkRed, green: darkGreen, blue: darkBlue, alpha: darkAlpha)
                    default:
                        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
                }
            }
        } else {
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    }
    
    convenience init(white: CGFloat, alpha: CGFloat = 1, black: CGFloat, darkAlpha: CGFloat = 1) {
        if #available(iOS 13.0, *) {
            self.init { (traits) -> UIColor in
                switch traits.userInterfaceStyle {
                    case .dark:
                        return UIColor(white: black, alpha: darkAlpha)
                    default:
                        return UIColor(white: white, alpha: alpha)
                }
            }
        } else {
            self.init(white: white, alpha: alpha)
        }
    }
    
    convenience init(light: UIColor, dark: UIColor) {
        if #available(iOS 13.0, *) {
            self.init { (traits) -> UIColor in
                switch traits.userInterfaceStyle {
                    case .dark:
                        return light
                    default:
                        return dark
                }
            }
        } else {
            self.init(cgColor: light.cgColor)
        }
    }
}

#endif // os(iOS) || os(tvOS) || os(watchOS)
