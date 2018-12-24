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
    
    static func fetchRegister(_ name: String, _ email: String, _ password: String, completion: @escaping (APIDecodingResult<UserModel>) -> Void) {
        
        let request = RegisterRequest(name: name, email: email, password: password)
        APIClient.send(request, decodingCompletion: completion)
    }
}
