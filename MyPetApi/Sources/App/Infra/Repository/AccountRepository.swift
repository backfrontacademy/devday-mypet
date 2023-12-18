import Fluent

final class AccountRepository: IAccountRepository {
    
    private let db: Database
    
    init(db: Database) {
        self.db = db
    }
    
    func save(account: AccountModel) async throws {
        try await account.save(on: db)
    }
    
    func getById(id: UUID) async throws -> (AccountModel?) {
        let account = try await AccountModel.query(on: db)
            .filter(\.$id == id)
            .first()
        return account
    }
    
    func getByEmail(email: String) async throws -> (AccountModel?) {
        let account = try await AccountModel.query(on: db)
            .filter(\.$email == email)
            .first()
        return account
    }
}
