//
//  NormalButton.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/13.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

@IBDesignable class NormalButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = 20
        self.layer.shadowColor = AppColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 2
        self.setTitleColor(AppColor.dark, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 16)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = AppColor.nonHighlighted
            } else {
                self.backgroundColor = AppColor.highlighted
            }
        }
    }
}
