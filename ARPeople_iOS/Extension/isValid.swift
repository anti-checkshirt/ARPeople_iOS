//
//  isValid.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/18.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

enum emailResult {
    case valid
    case invalid
}

func isValidEmail(_ email: String) -> emailResult {
    let emailRegEx = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: email)
    if result {
        return .valid
    } else {
        return .invalid
    }
}
