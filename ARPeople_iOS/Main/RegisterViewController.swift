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
    }
    
    private func showRequest(_ twitter: String, _ github: String, _ age: String) {
        let url = "http://localhost:3001/api/v1/user"
        let parameters: Parameters = [
            "name": AppUser.name,
            "email": AppUser.email,
            "password": AppUser.password,
            "twitterID": twitter,
            "githubID": github,
            "age": age
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            guard let data = response.data else { return }
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                let result = try! decoder.decode(User.self, from: data)
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInputField:
            emailInputField.becomeFirstResponder
        case emailInputField:
            passwordInputField.becomeFirstResponder
        case passwordInputField:
            ageInputField.becomeFirstResponder
        case ageInputField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
