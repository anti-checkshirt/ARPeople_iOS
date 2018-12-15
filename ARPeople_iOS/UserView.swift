//
//  UserView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

@IBDesignable
class UserView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.black
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .left
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.black
        label.textAlignment = .left
        return label
    }()
    
    private let userImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = AppColor.bgGlay
        image.layer.borderWidth = 2
        image.layer.borderColor = AppColor.bgGlay.cgColor
        image.clipsToBounds = true
        return image
    }()
    
    private let qiitaLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.black
        label.textAlignment = .left
        return label
    }()
    
    private let githubLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.black
        label.textAlignment = .left
        return label
    }()

    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(nameLabel)
        self.addSubview(userImageView)
        self.addSubview(ageLabel)
        self.addSubview(qiitaLabel)
        self.addSubview(githubLabel)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setUp() {
        nameLabel.text = "ともき"
        ageLabel.text = "16歳"
        qiitaLabel.text = "Qiita@tomoki_sun"
        githubLabel.text = "github@tomoki69386"
        guard let imageURL = URL(string: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg") else { return }
        userImageView.sd_setImage(with: imageURL)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.size.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(userImageView.snp.right).offset(30)
            make.right.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.right).offset(10)
            make.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(50)
        }
        
        qiitaLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.left.equalTo(userImageView.snp.right).offset(15)
            make.right.equalToSuperview().inset(30)
            make.height.equalTo(30)
        }
        
        githubLabel.snp.makeConstraints { make in
            make.top.equalTo(qiitaLabel.snp.bottom).offset(15)
            make.left.equalTo(userImageView.snp.right).offset(15)
            make.right.equalToSuperview().inset(30)
            make.height.equalTo(30)
        }
    }
}
