import Vapor

public func configure(_ app: Application) async throws {
    // CORS
    app.middleware.use(CORSMiddleware())
    
    // Database
    let sqlLiteDatabase = SqlLiteDatabase(databases: app.databases)
    let db = try sqlLiteDatabase.open()
    
    // Migration
    app.migrations.add(AccountMigration())
    try await app.autoMigrate()
    
    // Loger
    let logger: Logger = .init(label: "🚨 MyPetApiLogger ~> ")
    let consoleLogger = LoggerConsole(logger: logger)
    
    // Repository
    let accountRepository = AccountRepository(db: db)
    
    // Usecase
    let signup = Signup(accountRepository: accountRepository, logger: consoleLogger)
    
    // register routes
    try app.register(collection: AuthController(signup: signup))
}
