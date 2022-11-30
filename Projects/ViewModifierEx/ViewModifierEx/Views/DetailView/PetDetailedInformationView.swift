import SwiftUI

struct PetDetailedInformationView: View {
    var pet: Pet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Breed
            Text("Breed")
                .detailedInfoTitle()
            HStack {
                Image(systemName: "pawprint")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                Text(pet.breed)
            }
            .padding(.leading, 12)
            
            // Characteristics
            Text("Characteristics")
                .detailedInfoTitle()
            HStack {
                Image(systemName: "theatermasks.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                Text(pet.characteristics)
            }
            .padding(.leading, 12)
            
            // Size
            Text("Size")
                .detailedInfoTitle()
            HStack {
                Image(systemName: "flame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                Text(pet.size)
            }
            .padding(.leading, 12)
            
            // Sex
            Text("Sex")
                .detailedInfoTitle()
            HStack {
                Image(systemName: "bolt.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                Text(pet.sex)
            }
            .padding(.leading, 12)
            
            // Age
            Text("Age")
                .detailedInfoTitle()
            HStack {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                Text(pet.size)
            }
            .padding(.leading, 12)
        }
    }
}

struct PetDetailedInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailedInformationView(pet: Pet.example)
    }
}
