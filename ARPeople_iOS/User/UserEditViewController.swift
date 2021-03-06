//
//  UserEditViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import DKImagePickerController

class UserEditViewController: BaseViewController {
    
    @IBOutlet private weak var baseScrollView: UIScrollView!
    @IBOutlet private weak var headerImageView: EditImageView!
    @IBOutlet private weak var userImageView: EditUserImageView!
    @IBOutlet private weak var nameInputField: InputField!
    @IBOutlet private weak var jobInputField: InputField!
    @IBOutlet private weak var profileTextField: InputView!
    @IBOutlet private weak var twitterInputField: InputField!
    @IBOutlet private weak var githubInputField: InputField!
    @IBOutlet private weak var ageInputField: AgeInputField!
    
    private var txtActiveField: UITextField?
    let datepicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        showRequest()
        nameInputField.delegate = self
        jobInputField.delegate = self
        twitterInputField.delegate = self
        githubInputField.delegate = self
        ageInputField.delegate = self
        ageInputField.dateFormat = "yyyy年MM月dd日"

        headerImageView.setImage(url: "https://pbs.twimg.com/profile_banners/764414957920276480/1543038909/1500x500")
        
        profileTextField.placeholder = "プロフィール文章"
        
        setNav()
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(self.tapped))
        baseScrollView.addGestureRecognizer(tapGesture)
    }
    
    private func setNav() {
        let doneView = DoneBarButtonView(currentButton: .done, title: "保存")
        doneView.delegate = self
        let barButton = UIBarButtonItem(customView: doneView)
        navigationItem.setRightBarButton(barButton, animated: true)
        
        let cancelView = DoneBarButtonView(currentButton: .back, title: "戻る")
        cancelView.delegate = self
        let leftButton = UIBarButtonItem(customView: cancelView)
        navigationItem.setLeftBarButton(leftButton, animated: true)
    }
    
    private func showRequest() {
        UserAPI.fetchGetUser { (result) in
            switch result {
            case .success(let decoded):
                self.userImageView.setImage(url: decoded.imageURL)
                self.nameInputField.text = decoded.name
                self.jobInputField.text = decoded.job
                self.profileTextField.text = decoded.profileMessage
                self.twitterInputField.text = decoded.twitter
                self.githubInputField.text = decoded.github
                self.ageInputField.text = decoded.age
            case .failure(_, let statusCode):
                Alert().error(statusCode)
            }
        }
    }
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

extension UserEditViewController: DoneBarButtonViewDelegate {
    func didTappendButton(_ doneBarButtonView: DoneBarButtonView, currentButton: DoneBarButtonView.currentButton) {
        switch currentButton {
        case .done:
            let name = nameInputField.text!
            let job = jobInputField.text!
            let profile = profileTextField.text!
            let twitter = twitterInputField.text!
            let github = githubInputField.text!
            let age = ageInputField.text!
            if name.isEmpty { return }
            
            UserAPI.fetchChangeUser(name, AppUser.email, age, twitter, github, job: job, phoneNumber: "08023323620", profileMessage: profile) { (result) in
                switch result {
                case .success(let decoded):
                    print(decoded)
                    AppUser.saveUser(user: decoded)
                case .failure(_, let statusCode):
                    Alert().error(statusCode)
                }
            }

            self.dismiss(animated: true, completion: nil)
        case .back:
            self.dismiss(animated: true, completion: nil)
        case .setting:
            break
        }
    }
}

extension UserEditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInputField:
            jobInputField.becomeFirstResponder()
        case jobInputField:
            profileTextField.becomeFirstResponder()
        case profileTextField:
            twitterInputField.resignFirstResponder()
        case twitterInputField:
            githubInputField.resignFirstResponder()
        case githubInputField:
            ageInputField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        txtActiveField = nil
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtActiveField = textField
    }
    
    private func configureObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardHeight = notification.keyboardFrameEnd?.height else { return }
        guard  let navHeight = self.navigationController?.navigationBar.frame.height else { return }
        guard let txtActiveField = self.txtActiveField else { return }
        let myBoundHeight = UIScreen.main.bounds.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + statusBarHeight + navHeight
        let kbdLimit = myBoundHeight - keyboardHeight
        
        if txtLimit >= kbdLimit {
            baseScrollView.contentOffset.y -= txtLimit - kbdLimit
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        baseScrollView.contentOffset.y = 0
    }
}
