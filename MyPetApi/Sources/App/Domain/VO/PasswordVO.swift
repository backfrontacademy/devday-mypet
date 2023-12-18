import Foundation

enum PasswordValidationError: CustomError {
    
    case invalidPassword
    
    var errorMessage: String {
        switch self {
        case .invalidPassword:
            return "invalid password"
        }
    }
}

struct Password: Equatable {
    
    let value: String
    
    init(value: String) throws {
        self.value = value
        
        if self.isInvalidPassword(value) {
            throw PasswordValidationError.invalidPassword
        }
    }
    
    private func isInvalidPassword(_ value: String) -> Bool {
        let passwordRegex = #"^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$"#
        
        do {
            let regex = try NSRegularExpression(pattern: passwordRegex, options: [])
            let matches = regex.matches(in: value, options: [], range: NSRange(location: 0, length: value.utf16.count))
            return matches.isEmpty
        } catch {
            return true
        }
    }
}
