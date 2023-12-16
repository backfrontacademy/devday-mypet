//
//  ViewController.swift
//  MyPet
//
//  Created by Felipe Miranda on 16/12/23.
//

import UIKit
import Firebase

class LoginViewController: BaseViewController {
    
    var screen: LoginScreen?
    var dataProvider: LoginDataProvider?
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        self.dataProvider = LoginDataProvider()
        self.dataProvider?.setDelegate(delegate: self)
        self.screen?.emailTextField.text = "caio@outlook.com"
        self.screen?.passwordTextField.text = "123456"
        
    }

}

extension LoginViewController: LoginScreenProtocol {
    
    func tappedForgotPasswordButton() {
        
    }
    
    func tappedLoginButton() {
        
        self.dataProvider?.tappedLoginButton(email: screen?.emailTextField.text, password: self.screen?.passwordTextField.text)
    }
    
    func tappedRegisterButton() {
        print(#function)
    }
    
    func tappedPrivacyPolicyButton() {
        print(#function)
    }
}


// Register!!
//        Auth.auth().createUser(withEmail: "caio@outlook.com", password: "123456") { result, error in
//            if let error {
//                print("deu ruimmm -> \(error.localizedDescription)")
//            } else {
//                print("usuario cadastrado!!")
//            }
//        }



extension LoginViewController: LoginDataProviderProtocol {
    
    func startLoading() {
        self.loading?.start()
    }
    
    func stopLoading() {
        self.loading?.stop()
    }
    
    func success(model: Any?) {
        print("Usuário LOGADO COM SUCESSO")
    }
    
    func errorData(error: NSError?) {
        
        let alertAction = AlertAction(title: "Tentar novamente", style: .default) { [weak self] action in
            guard let self else { return }
            tappedLoginButton()
        }
        
        let cancel = AlertAction(title: "Cancelar", style: .cancel) { [weak self] action in
            guard let self else {return}
            self.loading?.stop()
        }
        
        AlertController.show(in: self, title: "Error Login", message: error?.localizedDescription, actions: [alertAction, cancel])
    }

}
