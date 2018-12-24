//
//  UserRequest.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Alamofire

/// ユーザー登録
struct RegisterRequest: APIRequest, DecodingRequest {
    
    typealias Decoded = UserModel
    static var httpMethod: HTTPMethod { return .post }
    
    var header: Headers { return .none }
    
    var path: String { return "/register" }
    
    var name: String
    var email: String
    var password: String
    
    var parameters: [String : String] {
        return [
            "name": name,
            "email": email,
            "password": password
        ]
    }
}

/// ログイン
struct AccessTokenRequest: APIRequest, DecodingRequest {
    
    typealias Decoded = AccessTokenModel
    static var httpMethod: HTTPMethod { return .post }
    
    var header: Headers { return .none }
    
    var path: String { return "login" }
    
    var email: String
    var password: String
    
    var parameters: [String : String] {
        return [
            "email": email,
            "password": password
        ]
    }
}

/// ユーザー情報の取得
struct UserRequest: APIRequest, DecodingRequest {
    
    typealias Decoded = UserModel
    static var httpMethod: HTTPMethod { return .get }
    
    var header: Headers { return .normal }
    
    var path: String { return "user" }
    
    var parameters: [String : String] { return [:]}
}

/// ユーザー情報の変更
struct ChangeUserRequest: APIRequest {

    static var httpMethod: HTTPMethod { return .put }
    var header: Headers { return .normal }
    var path: String { return "user" }
    
    var name: String
    var email: String
    var password: String
    var age: String
    var twitterID: String
    var githubID: String

    var parameters: [String : String] {
        return [
            "name": name,
            "email": email,
            "password": password,
            "age": age,
            "twitterID": twitterID,
            "githubID": githubID
        ]
    }
}
