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
        let password = passwordInputField.text!
        let emailValidator = ValidatorFactory.sharedInstance.emailValidator()
        let passwordVaildator = ValidatorFactory.sharedInstance.passwordValidator()
        switch emailValidator.validate(email) {
        case .valid:
            switch passwordVaildator.validate(password) {
            case .valid:
                print("成功")
            case .invalid(let errors):
                print(errors[0])
            }
        case .invalid(let errors):
            print(errors[0])
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
