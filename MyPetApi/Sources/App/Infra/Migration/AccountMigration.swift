import Fluent

final class AccountMigration: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        return try await database.schema("account")
            .id()
            .field("name", .string, .required)
            .field("email", .string, .required)
            .field("password", .string, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        return try await database.schema("account").delete()
    }
}

