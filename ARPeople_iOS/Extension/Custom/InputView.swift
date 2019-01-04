//
//  InputView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class InputView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: .zero, textContainer: textContainer)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    private func setUp() {
        self.layer.cornerRadius = 5
        self.backgroundColor = AppColor.bgGlay
    }
}
