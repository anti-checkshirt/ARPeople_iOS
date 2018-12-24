//
//  SettingUserViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class SettingUserViewController: UIViewController {
    
    @IBOutlet private weak var twitterInputField: UITextField!
    @IBOutlet private weak var githubInputField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        twitterInputField.delegate = self
        githubInputField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SettingUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == twitterInputField {
            githubInputField.becomeFirstResponder()
        } else {
            githubInputField.resignFirstResponder()
        }
        return true
    }
}
