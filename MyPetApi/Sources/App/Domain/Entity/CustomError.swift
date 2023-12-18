import Foundation

protocol CustomError: Error {
    var errorMessage: String { get }
}

