enum AccountValidationError: CustomError {
    case passwordNotIsEqual
    
    var errorMessage: String {
        switch self {
        case .passwordNotIsEqual:
            return "password not is equal"
        }
    }
}


internal struct SignupInput {
    let name: String
    let email: Email
    let password: Password
    let confirmPassword: Password
    
    init(name: String, email: Email, password: Password, confirmPassword: Password) throws {
        self.name = name
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        
        if password != confirmPassword {
            throw AccountValidationError.passwordNotIsEqual
        }
    }
}

