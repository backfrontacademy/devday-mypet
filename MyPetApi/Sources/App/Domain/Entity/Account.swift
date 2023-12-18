import Foundation

struct Account: Decodable {
    let name: String
    let email: String
    let password: String
    let confirmPassword: String
}
