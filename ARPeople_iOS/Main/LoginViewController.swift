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
    
    @IBOutlet private var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passInputField.delegate = self
        mailInputField.delegate = self
        
        setLayout()
    }
    private func setLayout() {
        button.layer.cornerRadius = button.frame.height / 2
        
    }
    
    
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case passInputField:
            passInputField.becomeFirstResponder()
        case mailInputField:
            mailInputField.becomeFirstResponder()
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}
