import Foundation

enum EmailValidationError: CustomError {
    
    case invalidEmail
    
    internal var errorMessage: String {
        switch self {
        case .invalidEmail:
            return "invalid email"
        }
    }
}

internal struct Email {
    
    let value: String
    
    init(value: String) throws {
        self.value = value
        
        if self.isInvalidEmail(value) {
            throw EmailValidationError.invalidEmail
        }
    }

    private func isInvalidEmail(_ value: String) -> Bool {
        let emailRegex = #"^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$"#
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegex, options: [])
            let matches = regex.matches(in: value, options: [], range: NSRange(location: 0, length: value.utf16.count))
            return matches.isEmpty
        } catch {
            return true
        }
    }
}
