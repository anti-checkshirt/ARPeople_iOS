//
//  UserView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/16.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class UserView: UIView {
    
    private let imageView = UIImageView(image: UIImage(named: "スクリーンショット 2018-12-25 17.18.35"))
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = AppColor.glay
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setUp() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = self.bounds
    }
}
