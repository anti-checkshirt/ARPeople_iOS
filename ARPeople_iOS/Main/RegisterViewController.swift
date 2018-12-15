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
    @IBOutlet private weak var chooseButton:  UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInputField.delegate = self
        ageInputField.delegate = self
        gitidInputField.delegate = self
        twitteridInputField.delegate = self
        
        setLayout()
        showRequest()
        
    }
    private func setLayout() {
        chooseButton.layer.cornerRadius = chooseButton.frame.height / 2
    }
    
    @IBAction private func uploadimg(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let pickerView = UIImagePickerController()
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            self.present(pickerView, animated: true)
        }
        
    }
    
    private func showRequest() {
        let url = "http://localhost:3001/api/v1/search"
        let parameters: Parameters = [
            "name": "ともき",
            "email": "hoge@example.com",
            "password": "abc123abc",
            "twitterID": "tomoki_sun",
            "githubID": "tomoki69386",
            "age": "12"
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

