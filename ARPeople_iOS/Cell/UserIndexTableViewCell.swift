//
//  UserIndexTableViewCell.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/02.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class UserIndexTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLayout()
    }
    
    private func setLayout() {
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.clipsToBounds = true
    }
    
    func setUp() {
        nameLabel.text = "築山朋紀"
        ageLabel.text = "10"
        emailLabel.text = "tomoki69386@gmail.com"
        userImageView.setImage(url: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
