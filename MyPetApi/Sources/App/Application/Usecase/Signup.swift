import Foundation
import Vapor

enum SignupError: CustomError {
    case duplicatedAccount
    
    var errorMessage: String {
        switch self {
        case .duplicatedAccount:
            return "duplicate account"
        }
    }
}


final class Signup {
    
    private let accountRepository: IAccountRepository
    private let logger: ILogger
    
    init(accountRepository: IAccountRepository, logger: ILogger) {
        self.accountRepository = accountRepository
        self.logger = logger
    }
    
    internal func execute(input: SignupInput) async throws {
        logger.log(message: "Signup: \(input)")
        
        let existingAccount = try await accountRepository.getByEmail(email: input.email.value);
        
        guard existingAccount == nil else { throw SignupError.duplicatedAccount }
        
        let passwordEncripted = try Bcrypt.hash(input.password.value)
        let account = AccountModel.create(name: input.name,
                                          email: input.email.value,
                                          password: passwordEncripted)
        
        try await accountRepository.save(account: account)
    }
}
