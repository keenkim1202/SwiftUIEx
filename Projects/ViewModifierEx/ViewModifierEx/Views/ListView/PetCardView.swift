import SwiftUI

struct PetCardView: View {
    var pet: Pet
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(pet.photo)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipped()
                .background(.gray)
            
            Rectangle()
                .overlay {
                    Text(pet.name)
                        .foregroundColor(.white)
                        .font(.title2)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
        }
    }
}

struct PetCardView_Previews: PreviewProvider {
    static var previews: some View {
        PetCardView(pet: Pet.example)
    }
}
