import Foundation

struct Pet: Decodable, Hashable {
  let id: String
  let name: String
  let photo: String
  let photoAuthor: String
  let breed: String
  let characteristics: String
  let size: String
  let sex: String
  let age: String

#if DEBUG
  static let example = Pet(
    id: "008",
    name: "Bernie",
    photo: "bernie-008",
    photoAuthor: "Alexandra Lau",
    breed: "Bernese",
    characteristics: "Loyal, Playful, Affectionate",
    size: "Large",
    sex: "Male",
    age: "Adult"
  )
#endif
}
