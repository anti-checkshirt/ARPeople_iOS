//
//  AccountView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/19.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

@IBDesignable
class AccountView: UIView {
    
    private let baseView = UIView()
    private let userImageView = UIImageView()
    private let nameLabel = UILabel()
    private let friendView = UIView()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        baseView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.size.equalToSuperview()
        }
        
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaInsets)
            make.left.equalTo(20)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(userImageView.snp.width)
        }
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.left.equalTo(userImageView.snp.right).offset(20)
        }
        
        friendView.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(50)
            make.left.equalTo(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(128)
        }
        print(nameLabel.frame)
    }
    
    private func setLayout() {
        self.addSubview(baseView)
        self.addSubview(userImageView)
        self.addSubview(nameLabel)
        self.addSubview(friendView)
        
        baseView.backgroundColor = AppColor.main
        userImageView.clipsToBounds = true
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 20)
        friendView.layer.cornerRadius = 10
        friendView.backgroundColor = AppColor.yellow
        
        let imageURL = URL(string: "https://pbs.twimg.com/profile_images/1049009709846487040/LiSPyWT__400x400.jpg")
        userImageView.sd_setImage(with: imageURL)
        nameLabel.text = "ともき"
        
    }
}
