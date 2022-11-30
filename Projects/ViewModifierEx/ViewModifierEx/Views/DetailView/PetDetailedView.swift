import SwiftUI

struct PetDetailedView: View {
    var pet: Pet
    @State private var showingAlert = false
    @State private var adopt = false
    @State private var emailAddress = ""
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    ZStack(alignment: .bottom) {
                        Image(pet.photo)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geo.size.width, maxHeight: 300)
                            .clipped()
                            .background(.gray)
                        Rectangle()
                            .overlay(alignment: .trailing) {
                                Text("Photo by \(pet.photoAuthor)")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .padding(.trailing, 15)
                            }
                            .frame(maxWidth: geo.size.width, maxHeight: 50)
                            .opacity(0.6)
                    }
                    
                    PetDetailedInformationView(pet: pet)
                        .padding(.leading, 20)
                        .padding(.bottom, 25)
                    
                    Divider()
                        .padding(.horizontal, 16)
                    
                    AdoptionFormView()
                    Spacer()
                }
            }
        }
    }
}

struct PetDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailedView(pet: Pet.example)
    }
}
