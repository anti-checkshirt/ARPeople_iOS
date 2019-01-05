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
    
    /// 新規登録
    static func fetchRegister(_ name: String, _ email: String, _ password: String, completion: @escaping (APIDecodingResult<UserModel>) -> Void) {
        
        let request = RegisterRequest(name: name, email: email, password: password)
        APIClient.send(request, decodingCompletion: completion)
    }
    
    ///ログイン
    static func fetchLogin(_ email: String, _ password: String, completion: @escaping (APIDecodingResult<UserModel>) -> Void) {
        let request = AccessTokenRequest(email: email, password: password)
        APIClient.send(request, decodingCompletion: completion)
    }
    
    /// ユーザー情報取得
    static func fetchGetUser(completion: @escaping (APIDecodingResult<UserModel>) -> Void) {
        let request = UserRequest()
        APIClient.send(request, decodingCompletion: completion)
    }
    
    /// ユーザー情報を変更
    static func fetchChangeUser(_ name: String, _ email: String, _ password: String, _ age: String, _ twitterID: String, _ githubID: String, job: String, phoneNumber: String, profileMessage: String, completion: @escaping (APIDecodingResult<UserModel>) -> Void) {
        let request = ChangeUserRequest(name: name, email: email, password: password, age: age, twitterID: twitterID, githubID: githubID, job: job, phoneNumber: phoneNumber, profileMessage: profileMessage)
        APIClient.send(request, decodingCompletion: completion)
    }
}
