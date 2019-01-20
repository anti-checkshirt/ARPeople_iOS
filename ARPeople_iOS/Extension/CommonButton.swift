//
//  CommonButton.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/13.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

@IBDesignable class CommonButton: UIButton {
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = self.shadowRadius
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
    @IBInspectable var maskToBounds: Bool = false {
        didSet {
            self.layer.masksToBounds = self.maskToBounds
        }
    }
    @IBInspectable var highlightedAlpha: CGFloat = 0.0
    @IBInspectable var highlightedBackgroundColor: UIColor = .clear
    @IBInspectable var nonHighlightedAlpha: CGFloat = 0.0
    @IBInspectable var nonHighlightedBackgroundColor: UIColor = .clear
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = self.highlightedBackgroundColor
                self.alpha = self.highlightedAlpha
            } else {
                self.backgroundColor = self.nonHighlightedBackgroundColor
                self.alpha = self.nonHighlightedAlpha
            }
        }
    }
}
