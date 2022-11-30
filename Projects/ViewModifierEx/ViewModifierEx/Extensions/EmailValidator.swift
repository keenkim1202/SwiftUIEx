import Foundation

class EmailValidator: ObservableObject {
  // One or more characters followed by an "@",
  // then one or more characters followed by a ".",
  // and finishing with one or more characters
  let emailPattern = #"^\S+@\S+\.\S+$"#

  @Published var email = ""

  func isValid(_ email: String) -> Bool {
    email.range(
      of: emailPattern,
      options: .regularExpression
    ) != nil
  }
}
