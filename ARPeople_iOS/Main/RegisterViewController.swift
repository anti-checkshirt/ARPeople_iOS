//
//  RegisterViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: BaseViewController {
    
    @IBOutlet private weak var baseScrollView: UIScrollView!
    @IBOutlet private weak var nameInputField: UITextField!
    @IBOutlet private weak var emailInputField: UITextField!
    @IBOutlet private weak var passwordInputField: UITextField!
    @IBOutlet private weak var password2InputFiled: UITextField!
    @IBOutlet private weak var errorNotice: UILabel!
    @IBOutlet private weak var nameView: UIView!
    @IBOutlet private weak var emailView: UIView!
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var password2View: UIView!
    
    private var activeView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInputField.delegate = self
        emailInputField.delegate = self
        passwordInputField.delegate = self
        password2InputFiled.delegate = self
        configureObserver()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.tappend))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tappend(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction private func createUser() {
        let name = nameInputField.text!
        if name.isEmpty { return errorNotice.text = "名前を入力してください" }
        let email = emailInputField.text!
        let password = passwordInputField.text!
        let password2 = password2InputFiled.text!
        
        if password != password2 { return errorNotice.text = "パスワードが一致しません" }
        
        let emailValidator = ValidatorFactory.sharedInstance.emailValidator()
        let passwordVaildator = ValidatorFactory.sharedInstance.passwordValidator()
        
        switch emailValidator.validate(email) {
        case .valid:
            switch passwordVaildator.validate(password) {
            case .valid:
                errorNotice.text = ""
            case .invalid(let errors):
                errorNotice.text = errors.first
                return
            }
        case .invalid(let errors):
            errorNotice.text = errors.first
            return
        }
        
        UserAPI.fetchRegister(name, email, password) { (result) in
            switch result {
            case .success(let decoded):
                print(decoded)
                AppUser.saveUser(user: decoded)
                self.performSegue(withIdentifier: "toSettingUser", sender: nil)
            case .failure(_, let statusCode):
                self.error(statusCode: statusCode)
            }
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
            password2InputFiled.becomeFirstResponder()
        case textField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeView = nil
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case nameInputField:
            activeView = nameView
        case emailInputField:
            activeView = emailView
        case passwordInputField:
            activeView = passwordView
        case password2View:
            activeView = password2View
        default:
            break
        }
    }
    
    private func configureObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardHeight = notification.keyboardFrameEnd?.height else { return }
        guard  let navHeight = self.navigationController?.navigationBar.frame.height else { return }
        guard let activeView = self.activeView else { return }
        let myBoundHeight = UIScreen.main.bounds.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let txtLimit = activeView.frame.maxY + statusBarHeight + navHeight
        let kbdLimit = myBoundHeight - keyboardHeight
        
        if txtLimit >= kbdLimit {
            baseScrollView.contentOffset.y = txtLimit - kbdLimit
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        baseScrollView.contentOffset.y = 0
    }
}
