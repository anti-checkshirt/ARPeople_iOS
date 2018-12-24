//
//  RegisterViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet private weak var nameInputField: UITextField!
    @IBOutlet private weak var emailInputField: UITextField!
    @IBOutlet private weak var passwordInputField: UITextField!
    @IBOutlet private weak var ageInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInputField.delegate = self
        emailInputField.delegate = self
        passwordInputField.delegate = self
        ageInputField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.tappend))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tappend(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction private func createUser() {
        let email = emailInputField.text!
        if email.isEmpty {
            print("メールアドレスを入力してください")
            return
        }
        switch isValidEmail(email) {
        case .valid:
            print("valid")
        case .invalid:
            print("invalid")
        }
        
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInputField:
            emailInputField.becomeFirstResponder()
        case emailInputField:
            passwordInputField.becomeFirstResponder()
        case passwordInputField:
            ageInputField.becomeFirstResponder()
        default:
            break
        }
        return true
    }
}
