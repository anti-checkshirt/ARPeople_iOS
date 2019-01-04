//
//  InputView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

@IBDesignable
class InputView: UITextView {
    
    private let placeHolderLabel = UILabel()
    
    var placeholder: String = "" {
        didSet {
            placeHolderLabel.text = placeholder
        }
    }
    
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
        self.delegate = self
        
        placeHolderLabel.numberOfLines = 0
        placeHolderLabel.textColor = .lightGray
        self.addSubview(placeHolderLabel)
        placeHolderLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.right.equalTo(self)
        }
    }
}

extension InputView: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        placeHolderLabel.isHidden = true
        return true
    }
    
    //textviewからフォーカスが外れて、TextViewが空だったらLabelを再び表示
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
        }
    }
}
