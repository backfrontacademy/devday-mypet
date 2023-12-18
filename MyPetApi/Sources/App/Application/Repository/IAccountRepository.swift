import Foundation

protocol IAccountRepository: AnyObject {
    func save(account: AccountModel) async throws
    func getById(id: UUID) async throws -> (AccountModel?)
    func getByEmail(email: String) async throws -> (AccountModel?)
}
