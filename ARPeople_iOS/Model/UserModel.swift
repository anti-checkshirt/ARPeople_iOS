//
//  User.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

struct UserModel: Codable {
    
    /// name
    let name: String
    
    /// password
    let password: String
    
    /// age
    let age: String
    
    /// mail
    let mail: String
    
    /// twitter
    let twitter: String
    
    /// github
    let github: String
    
    ///imageURL
    let imageURL: String
    
    /// UUID
    let id: String
    
    /// AccessToken
    let token: String
    
    /// プロフィール文章
    let profileMessage: String
    
    /// 職業
    let job: String
    
    /// 電話番号
    let phoneNumber: String
    
}

extension UserModel {

    enum CodingKeys: String, CodingKey {
        case name
        case password = "password_digest"
        case age
        case mail = "email"
        case twitter = "twitter_id"
        case github = "github_id"
        case imageURL = "user_image_url"
        case id = "uuid"
        case token = "access_token"
        case profileMessage = "profile_message"
        case job
        case phoneNumber = "phone_number"
    }
}
