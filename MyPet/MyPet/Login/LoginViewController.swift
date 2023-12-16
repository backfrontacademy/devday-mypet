//
//  ViewController.swift
//  MyPet
//
//  Created by Felipe Miranda on 16/12/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
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
        Auth.auth().signIn(withEmail: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "") { result, error in
            if let error {
                print("deu ruimmm -> \(error.localizedDescription)")
            } else {
                print("usuario logado!!")
            }
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

