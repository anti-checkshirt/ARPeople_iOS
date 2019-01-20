//
//  UIScrollView+Extension.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/20.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

extension UIScrollView {
    var currentPage: Int {
        return Int((self.contentOffset.x + (0.5 * self.bounds.width)) / self.bounds.width) + 1
    }
    
    func nextMove() {
        UIView.animate(withDuration: 0.3) {
            self.contentOffset.x += self.frame.width
        }
    }
    
    func previousMove() {
        UIView.animate(withDuration: 0.3) {
            self.contentOffset.x -= self.frame.width
        }
    }
}
