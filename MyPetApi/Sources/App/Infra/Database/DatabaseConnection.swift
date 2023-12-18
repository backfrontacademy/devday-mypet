import Fluent

enum DatabaseConnectionError: CustomError {
    case failureConnection
    
    var errorMessage: String {
        switch self {
        case .failureConnection:
            return "Failed to connect to database"
        }
    }
}

protocol DatabaseConnection {
    func open() throws -> Database
    func close() throws
}
