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
    }

}

extension LoginViewController: LoginScreenProtocol {
    func tappedForgotPasswordButton() {
        
    }
    
    func tappedLoginButton() {
        loading?.start()
        Auth.auth().signIn(withEmail: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "") { [weak self] result, error in
            guard let self else { return }
            if let error {
                
                var alertAction = AlertAction(title: "Tentar novamente", style: .default) { [weak self] action in
                    guard let self else { return }
                    tappedLoginButton()
                }
                
                var cancel = AlertAction(title: "Cancelar", style: .cancel, handler: nil)
                
                AlertController.show(in: self, title: "Error Login", message: error.localizedDescription, actions: [alertAction, cancel])
            } else {
                print("usuario logado!!")
            }
            loading?.stop()
        }
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

