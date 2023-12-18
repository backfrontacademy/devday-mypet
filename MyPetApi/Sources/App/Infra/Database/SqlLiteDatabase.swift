import Fluent
import FluentSQLiteDriver

final class SqlLiteDatabase: DatabaseConnection {
    
    private let databases: Databases
    
    init(databases: Databases) {
        self.databases = databases
    }
    
    func open() throws -> Database {
        databases.use(.sqlite(.memory), as: .sqlite)
        
        let database: Database? = databases.database(.sqlite,
                                                     logger: FluentSQLiteDriver.Logger(label: "DatabaseLogger"),
                                                     on: databases.eventLoopGroup.next())
        
        guard let database else {
            throw DatabaseConnectionError.failureConnection
        }
        
        return database
    }
    
    func close() {
        databases.shutdown()
        try? databases.threadPool.syncShutdownGracefully()
        try? databases.eventLoopGroup.syncShutdownGracefully()
    }
}
