import SwiftUI

struct KeenToastView: View {
    var type: KeenToastStyle
    var title: String
    var message: String
    var onCancel: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: type.iconName)
                    .foregroundColor(type.themeColor)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                    Text(message)
                        .font(.system(size: 12))
                        .foregroundColor(.black.opacity(0.6))
                }
                
                Spacer(minLength: 10)
                
                Button(action: onCancel) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        .background(.white)
        .overlay(
            Rectangle()
                .fill(type.themeColor)
                .frame(width: 6)
                .clipped()
            , alignment: .leading
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding(.horizontal, 16)
    }
}

struct KeenToast: Equatable {
    var type: KeenToastStyle
    var title: String
    var message: String
    var duration: Double = 3
}

struct KeenToastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            KeenToastView(
                type: .success,
                title: "Success",
                message: "this is success message.") {}
            KeenToastView(
                type: .info,
                title: "Info",
                message: "this is info message.") {}
            KeenToastView(
                type: .warning,
                title: "Warning",
                message: "this is warning message.") {}
            KeenToastView(
                type: .error,
                title: "Error",
                message: "this is error message.") {}
        }
    }
}
