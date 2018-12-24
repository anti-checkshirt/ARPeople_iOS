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
    
    /// UUID
    static var uuid: String {
        return Defaults[.uuid]
    }
    
    /// アクセストークン
    static var token: String {
        return Defaults[.token]
    }
    
    /// stagingのURL
    static var stagingURL: String {
        return Defaults[.staging]
    }
}

extension AppUser {

    /// 仮保存
    static func saveUser(user: UserModel) {
        Defaults[.name] = user.name
        Defaults[.email] = user.mail
        Defaults[.password] = user.password
        Defaults[.age] = user.age!
        Defaults[.twitter] = user.twitter!
        Defaults[.github] = user.github!
        Defaults[.imageURL] = user.imageURL!
        Defaults[.uuid] = user.id
    }
    
    /// アクセストークン保存
    static func save(token: String) {
        Defaults[.token] = token
    }
    
    static func saveEnv(staging: String) {
        Defaults[.staging] = staging
    }
}

private extension DefaultsKeys {
    static let token = DefaultsKey<String>("AccessToken", defaultValue: "")
    static let staging = DefaultsKey<String>("staging_url", defaultValue: "")
    
    /// UserModel
    static let name = DefaultsKey<String>("name", defaultValue: "")
    static let email = DefaultsKey<String>("email", defaultValue: "")
    static let password = DefaultsKey<String>("password", defaultValue: "")
    static let age = DefaultsKey<String>("age", defaultValue: "")
    static let twitter = DefaultsKey<String>("twitter_id", defaultValue: "")
    static let github = DefaultsKey<String>("github_id", defaultValue: "")
    static let imageURL = DefaultsKey<String>("image_url", defaultValue: "")
    static let uuid = DefaultsKey<String>("User_UUID", defaultValue: "")
}
