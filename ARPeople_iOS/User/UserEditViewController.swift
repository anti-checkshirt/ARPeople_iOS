//
//  UserEditViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class UserEditViewController: BaseViewController {
    
    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var userImageView: UserImageView!
    @IBOutlet private weak var nameInputField: InputField!
    @IBOutlet private weak var jobInputField: InputField!
    @IBOutlet private weak var profileTextField: InputView!
    @IBOutlet private weak var twitterInputField: InputField!
    @IBOutlet private weak var githubInputField: InputField!
    @IBOutlet private weak var ageInputField: InputField!

    override func viewDidLoad() {
        super.viewDidLoad()

        headerImageView.setImage(url: "https://pbs.twimg.com/profile_banners/764414957920276480/1543038909/1500x500")
        userImageView.setImage(url: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
    }

}
