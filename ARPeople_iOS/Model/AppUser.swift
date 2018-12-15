//
//  AppUser.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/14.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

struct AppUser {
    
    /// ユーザーのメールアドレス
    static var email: String {
        return Defaults[.email]
    }
}

extension AppUser {
    
    /// メールアドレスの保存
    static func saveEmail(email: String) {
        Defaults[.email] = email
    }
}

private extension DefaultsKeys {
    static let email = DefaultsKey<String>("email")
}
