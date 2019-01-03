//
//  AppKeychain.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import KeychainAccess

struct AppKeychain {
    private init() {}
    
    private static var keychain: Keychain {
        return Keychain(service: "com.tomoki.ARPeople-iOS")
    }
    
    /// メールアドレス
    static var email: String? {
        do {
            return try keychain.get("mailAddress")
        } catch {
            return nil
        }
    }
    
    /// パスワード
    static var password: String? {
        do {
            return try keychain.get("password")
        } catch {
            return nil
        }
    }
    
    static func save(email: String, password: String) {
        try? keychain.set(email, key: "mailAddress")
        try? keychain.set(password, key: "password")
    }
}
