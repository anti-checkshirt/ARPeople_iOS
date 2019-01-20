//
//  UserImageView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

@IBDesignable
class UserImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        
        setUp()
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    private func setUp() {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.cornerRadius = 50
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
}

class EditImageView: UIImageView {
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "000000", alpha: 0.3)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    private func setUp() {
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

class EditUserImageView: UserImageView {
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "000000", alpha: 0.3)
        button.layer.cornerRadius = 50
        return button
    }()

    override init() {
        super.init(frame: .zero)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    private func setUp() {
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
