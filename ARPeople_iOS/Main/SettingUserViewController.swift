//
//  SettingUserViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class SettingUserViewController: UIViewController {

    @IBOutlet private weak var mailInputField: UITextField!
    @IBOutlet private weak var nameInputField: UITextField!
    
    @IBOutlet private weak var pass1InputField: UITextField!
    @IBOutlet private weak var pass2InputField: UITextField!
    
    @IBOutlet private var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailInputField.delegate = self
        nameInputField.delegate = self
        pass1InputField.delegate = self
        pass2InputField.delegate = self

        setLayout()
    }
    
    private func setLayout() {
        registerButton.layer.cornerRadius = registerButton.frame.height / 2
    }
    
    @IBAction private func register() {
        guard let name = nameInputField.text else { return }
        guard let mail = mailInputField.text else { return }
        guard let pass1 = pass1InputField.text else { return }
        guard let pass2 = pass2InputField.text else { return }
        
        if name.isEmpty {
            print("hgoe")
            return
        }
        if mail.isEmpty {
            return
        }
        if pass1.isEmpty {
            return
        }
        if pass2.isEmpty {
            return
        }
        
        if pass1 != pass2 {
            return
        }
        AppUser.saveUser(name: name, email: mail, password: pass1)
        let VC = RegisterViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension SettingUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInputField:
            mailInputField.becomeFirstResponder()
        case mailInputField:
            pass1InputField.becomeFirstResponder()
        case pass1InputField:
            pass2InputField.becomeFirstResponder()
        case pass2InputField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
