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
    
    /// 名前
    static var name: String {
        return Defaults[.name]
    }

    /// メールアドレス
    static var email: String {
        return Defaults[.email]
    }
    
    /// パスワード
    static var password: String {
        return Defaults[.password]
    }
    
    /// stagingのURL
    static var stagingURL: String {
        return Defaults[.staging]
    }
}

extension AppUser {

    /// 仮保存
    static func saveUser(name: String, email: String, password: String) {
        Defaults[.name] = name
        Defaults[.email] = email
        Defaults[.password] = password
    }
    
    static func saveEnv(staging: String) {
        Defaults[.staging] = staging
    }
}

private extension DefaultsKeys {
    static let email = DefaultsKey<String>("email")
    static let password = DefaultsKey<String>("password")
    static let name = DefaultsKey<String>("name")
    
    static let staging = DefaultsKey<String>("staging_url", defaultValue: "")
}
