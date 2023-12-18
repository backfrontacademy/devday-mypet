import Fluent
import Vapor

internal final class AccountModel: Model {

    static let schema = "account"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String

    @Field(key: "email")
    var email: String
    
    @Field(key: "password")
    var password: String
    
    init() {}
    
    private init(id: UUID? = .init(), name: String, email: String, password: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
    
    static func create(name: String, email: String, password: String) -> AccountModel {
        let account = self.init(name: name, email: email, password: password)
        return account
    }
    
    static func restore(id: UUID, name: String, email: String, password: String) -> AccountModel {
        let account = self.init(id: id, name: name, email: email, password: password)
        return account
    }
}
