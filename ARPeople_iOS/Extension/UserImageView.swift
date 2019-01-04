//
//  UserImageView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

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
