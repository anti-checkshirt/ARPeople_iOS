//
//  UserAPI.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation

struct UserAPI {
    
    private init() {}
    
    static func fetchRegister(name: String, email: String, password: String, age: String, completion: @escaping (APIDecodingResult<UserModel>) -> Void) {
        
        let request = RegisterRequest(name: name, email: email, password: password, age: age)
        APIClient.send(request, decodingCompletion: completion)
    }
}
