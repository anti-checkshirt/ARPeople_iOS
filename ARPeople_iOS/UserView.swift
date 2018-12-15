//
//  UserView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/16.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit

class UserView: UIView {
    
    private let nameLabel = UILabel()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel.text = "ともき"
        nameLabel.font = .boldSystemFont(ofSize: 120)
        nameLabel.textAlignment = .left
        nameLabel.backgroundColor = .white
        nameLabel.frame = self.bounds
        self.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        nameLabel.snp.makeConstraints { make in
//            make.left.top.size.equalToSuperview()
//        }
    }
    
}
