import SwiftUI

struct KeenToastView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.red)
                
                VStack(alignment: .leading) {
                    Text("Error")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Unknown error occured.")
                        .font(.system(size: 12))
                        .foregroundColor(.black.opacity(0.6))
                }
                
                Spacer(minLength: 10)
                
                Button {
                    // TODO
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        .background(.white)
        .overlay(
            Rectangle()
                .fill(.red)
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

struct KeenToastView_Previews: PreviewProvider {
    static var previews: some View {
        KeenToastView()
    }
}
