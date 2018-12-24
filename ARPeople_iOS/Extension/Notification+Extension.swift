//
//  Notification+Extension.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

extension Notification {
    
    var keyboardFrameEnd: CGRect? {
        return self.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
    }
    
    var keyboardAnimationDuration: TimeInterval? {
        return self.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
    }
    
    var keyboardAnimationOptions: UIView.AnimationOptions? {
        guard let curveValue = self.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return nil }
        return UIView.AnimationOptions(rawValue: curveValue)
    }
}
