//
//  LoginViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var passInputField: UITextField!
    @IBOutlet private weak var mailInputField: UITextField!
    @IBOutlet private weak var errorNotice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passInputField.delegate = self
        mailInputField.delegate = self
    }
    
    @IBAction private func login() {
        let email = mailInputField.text!
        let password = passInputField.text!
        if email.isEmpty { return errorNotice.text = "メールアドレスを入力してください" }
        if password.isEmpty { return errorNotice.text = "パスワードを入力してください" }
        UserAPI.fetchLogin(email, password) { (result) in
            switch result {
            case .success(let decoded):
                print(decoded.token)
            case .failure(let error, let statusCode):
                print(error); print(statusCode)
            }
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case mailInputField:
            passInputField.becomeFirstResponder()
        case textField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}
