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
    @IBOutlet private weak var ageInputField: UITextField!
    @IBOutlet private weak var gitidInputField: UITextField!
    @IBOutlet private weak var twitteridInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInputField.delegate = self
        ageInputField.delegate = self
        gitidInputField.delegate = self
        twitteridInputField.delegate = self
    }
    
    @IBAction private func register() {
        let twitter = twitteridInputField.text
        let github = gitidInputField.text
        let age = ageInputField.text
        
        showRequest(twitter!, github!, age!)
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
            ageInputField.becomeFirstResponder()
        case ageInputField:
            gitidInputField.becomeFirstResponder()
        case gitidInputField:
            twitteridInputField.becomeFirstResponder()
        case twitteridInputField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}

