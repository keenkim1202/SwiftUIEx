import SwiftUI

struct AdoptionFormView: View {
    @State private var showingAlert = false
    @State private var adpot = false
    @StateObject var emailValidator = EmailValidator()
    
    var body: some View {
        VStack(alignment: .leading) {
            Section {
                TextField("Email address", text: $emailValidator.email)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            } header: {
                Text("Please enter your email address")
                    .font(.callout)
                    .padding(.leading, 16)
            }
            
            VStack(alignment: .center) {
                Button {
                    showingAlert = true
                    emailValidator.email = ""
                } label: {
                    Text("Adopt Me")
                        .buttonLabel()
                }
                .alert("Thank you!", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {}
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct AdoptionFormView_Previews: PreviewProvider {
    static var previews: some View {
        AdoptionFormView()
    }
}
