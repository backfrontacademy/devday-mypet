//
//  LoginDataProvider.swift
//  MyPet
//
//  Created by Felipe Miranda on 16/12/23.
//

import Foundation


protocol GenericDataProvider: AnyObject  {
    
    func success(model: Any?)
    func errorData(error: NSError?)
    func startLoading()
    func stopLoading()
}

class DataProviderManager<T, S>{
    
    var delegate: T?
    var model: S?
    
    
}


protocol LoginDataProviderProtocol: GenericDataProvider {
    
    
    
}

class LoginDataProvider: DataProviderManager <LoginDataProviderProtocol, Any> {
    
    private var apiStore: LoginAPIStore = LoginAPIStore()
    
    
    func setDelegate(delegate: LoginDataProviderProtocol) {
        self.delegate = delegate
    }
    
    
    func tappedLoginButton(email:String?, password: String?) {

        self.delegate?.startLoading()
        
        let _error = NSError(domain: "Error :( ", code: 400, userInfo:  [NSLocalizedDescriptionKey : "Todos os campos sao obrigatórios"])
        
        if let _email = email , let _password = password {
            
            self.apiStore.loginWith(email: _email, password: _password) { result, failure in
                
                if  result != nil {
                    self.delegate?.stopLoading()
                    self.delegate?.success(model: nil)
                }else{
                    self.delegate?.errorData(error: failure)
                }
            }
            
        }else {
            self.delegate?.stopLoading()
            self.delegate?.errorData(error: _error)
        }
                             
    }

}

