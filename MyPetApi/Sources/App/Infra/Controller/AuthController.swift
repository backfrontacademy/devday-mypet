import Vapor

struct AuthController: RouteCollection {
    
    private let signupUsecase: Signup
    
    init(signup: Signup) {
        self.signupUsecase = signup
    }
    
    func boot(routes: RoutesBuilder) throws {
        let endpoint = routes.grouped("account")
        endpoint.post("signup", use: signup)
    }
    
    func signup(req: Request) async throws -> Response {
        do  {
            let account = try req.content.decode(Account.self)
            let signupInput: SignupInput = try .init(name: account.name,
                                                 email: .init(value: account.email),
                                                 password: .init(value: account.password),
                                                 confirmPassword: .init(value: account.confirmPassword))
            try await signupUsecase.execute(input: signupInput)
            return .init(status: .created)
        } catch {
            guard let error = error as? CustomError else {
                throw Abort(.badRequest, reason: error.localizedDescription)
            }
            
            throw Abort(.badRequest, reason: error.errorMessage)
        }
    }
    
}
