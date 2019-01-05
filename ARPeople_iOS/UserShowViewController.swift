//
//  UserShowViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/16.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class UserShowViewController: BaseViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var twitterLabel: UILabel!
    @IBOutlet private weak var githubLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "ともき"
        ageLabel.text = "17歳"
        emailLabel.text = "tomoki@tomoki.com"
        twitterLabel.text = "tomoki_sun"
        githubLabel.text = "github"
    }
}
