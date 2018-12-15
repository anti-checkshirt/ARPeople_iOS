//
//  RegisterViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet private weak var nameInputField: UITextField!
    @IBOutlet private weak var ageInputField: UITextField!
    @IBOutlet private weak var gitidInputField: UITextField!
    @IBOutlet private weak var twitteridInputField: UITextField!
    @IBOutlet private weak var chooseButton:  UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameInputField.delegate = self
        ageInputField.delegate = self
        gitidInputField.delegate = self
        twitteridInputField.delegate = self
        
        setLayout()
        
    }
    private func setLayout() {
        chooseButton.layer.cornerRadius = chooseButton.frame.height / 2
    }
    
    
    
    @IBAction func uploadimg(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let pickerView = UIImagePickerController()
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            self.present(pickerView, animated: true)
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

