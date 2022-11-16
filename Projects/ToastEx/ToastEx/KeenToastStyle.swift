//
//  KeenToastStyle.swift
//  ToastEx
//
//  Created by KeenKim on 2022/11/16.
//

import SwiftUI

enum KeenToastStyle {
    case error
    case warning
    case success
    case info
}

extension KeenToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return .red
        case .warning: return .orange
        case .info: return .blue
        case .success: return .green
        }
    }
    
    var iconName: String {
        switch self {
        case .error: return "xmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .info: return "info.circle.fill"
        case.success: return "checkmark.circle.fill"
        }
    }
}
