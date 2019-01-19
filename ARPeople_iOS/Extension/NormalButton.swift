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
        self.layer.shadowColor = UIColor(hex: "414141").cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 2
        self.setTitleColor(UIColor(hex: "474E60"), for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = UIColor(hex: "D8D8D8")
            } else {
                self.backgroundColor = UIColor(hex: "F2F2F2")
            }
        }
    }
}
