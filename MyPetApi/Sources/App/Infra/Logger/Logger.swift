import Foundation
import Vapor

final class LoggerConsole: ILogger {
    
    private let logger: Logger
    
    init(logger: Logger) {
        self.logger = logger
    }
    
    func log(message: String) {
        let message: Logger.Message = .init(stringLiteral: message)
        logger.info(message)
    }
    
}
