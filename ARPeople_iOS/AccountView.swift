//
//  AccountView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/19.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SDWebImage

class AccountView: UIView {
    
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var friendView: UIView!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setLayout() {
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.clipsToBounds = true
        friendView.layer.cornerRadius = 10
        
        let imageURL = URL(string: "https://pbs.twimg.com/profile_images/1049009709846487040/LiSPyWT__400x400.jpg")
        userImageView.sd_setImage(with: imageURL)
        nameLabel.text = "ともき"
    }
}
