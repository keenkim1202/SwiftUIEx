// https://www.kodeco.com/34699757-swiftui-view-modifiers-tutorial-for-ios

import SwiftUI

struct PetListView: View {
    @State private var pets: [Pet] = Bundle.main.decode("pets.json")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(pets, id: \.id) { pet in
                        NavigationLink(value: pet) {
                            PetCardView(pet: pet)
                        }
                        .tint(.pink)
                    }
                }
            }
            .navigationTitle("Adpot A Pet")
            .navigationDestination(for: Pet.self) { pet in
                PetDetailedView(pet: pet)
                  .navigationTitle("Hi, I'm \(pet.name)")
            }
        }
    }
}

struct PetListView_Previews: PreviewProvider {
    static var previews: some View {
        PetListView()
    }
}
