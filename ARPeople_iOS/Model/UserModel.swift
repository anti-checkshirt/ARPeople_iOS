//
//  User.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation

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
}

extension UserModel {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case password = "password_digest"
        case age = "age"
        case mail = "email"
        case twitter = "twitter_id"
        case github = "github_id"
        case imageURL = "user_image_url"
        case id = "id"
    }
}
