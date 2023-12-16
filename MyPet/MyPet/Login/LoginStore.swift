//
//  LoginStore.swift
//  MyPet
//
//  Created by Felipe Miranda on 16/12/23.
//

import Foundation
import Firebase


protocol GenericStore {
    
    var error: NSError {set get}
    typealias completion <T> = (_ result: T, _ failure: NSError?) -> Void
}

protocol LoginStore: GenericStore {
    
    func loginWith(email: String?, password:String?, completion: @escaping completion<Bool?>)
    
}


class GenericAPIStore {
    
    var error = NSError(domain: "Error :( ", code: 400, userInfo:  [NSLocalizedDescriptionKey : "Tivemos um problema ao obter as informações"])
    
}

class LoginAPIStore: GenericAPIStore, LoginStore {
   
    func loginWith(email: String?, password: String?, completion: @escaping completion<Bool?>) {
        
        Auth.auth().signIn(withEmail: email ?? "", password: password ?? "") { [weak self] result, error in
            guard let self else {
                
                
                return completion(nil,self?.error)
                
                
            }
            
            if  error != nil {
                completion(false, self.error)
            } else {
                completion(true,nil)
                print("usuario logado!!")
            }
        }
    }
}
