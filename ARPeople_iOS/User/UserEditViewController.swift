//
//  UserEditViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class UserEditViewController: BaseViewController {
    
    @IBOutlet private weak var baseScrollView: UIScrollView!
    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var userImageView: UserImageView!
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
        
        nameInputField.delegate = self
        jobInputField.delegate = self
        twitterInputField.delegate = self
        githubInputField.delegate = self
        ageInputField.delegate = self
        ageInputField.dateFormat = "yyyy年MM月dd日"

        headerImageView.setImage(url: "https://pbs.twimg.com/profile_banners/764414957920276480/1543038909/1500x500")
        userImageView.setImage(url: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        
        let doneView = DoneBarButtonView(currentButton: .done)
        doneView.delegate = self
        let barButton = UIBarButtonItem(customView: doneView)
        navigationItem.setRightBarButton(barButton, animated: true)
        
        profileTextField.placeholder = "プロフィール文章"
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(self.tapped))
        baseScrollView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

extension UserEditViewController: DoneBarButtonViewDelegate {
    func didTappendButton(_ doneBarButtonView: DoneBarButtonView, currentButton: DoneBarButtonView.currentButton) {
        switch currentButton {
        case .done:
            self.dismiss(animated: true, completion: nil)
        case .setting, .back:
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
