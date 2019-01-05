//
//  UserIndexTableViewCell.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/02.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class UserIndexTableViewCell: UITableViewCell {
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let jobLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(userImageView)
        self.addSubview(nameLabel)
        self.addSubview(jobLabel)
        
        userImageView.snp.makeConstraints { make in
            make.top.left.equalTo(5)
            make.width.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(userImageView.snp.right).offset(5)
            make.right.equalTo(contentView.snp.rightMargin)
            make.height.equalTo(20)
        }
        
        jobLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.right.equalTo(nameLabel)
            make.bottom.equalTo(contentView).inset(5)
        }
    }
    
    func setUp() {
        UserAPI.fetchGetUser { (result) in
            switch result {
            case .success(let decoded):
                self.nameLabel.text = decoded.name
                self.jobLabel.text = decoded.job
                self.userImageView.setImage(url: decoded.imageURL)
            case .failure(_, let statusCode):
                print(statusCode ?? "")
            }
        }
    }

}
