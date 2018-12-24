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
