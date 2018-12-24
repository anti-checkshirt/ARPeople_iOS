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
    
//    "Github_ID" = tomoki69386;
//    "Twitter_ID" = "<null>";
//    age = 12;
//    "created_at" = "2018-12-15T09:56:22.578Z";
//    email = "aaaaa@example.com";
//    id = 2;
//    name = "\U3068\U3082\U304d";
//    "password_digest" = abc123abc;
//    "updated_at" = "2018-12-15T09:56:22.578Z";
//    "user_image_url" = "<null>";

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case password = "password_digest"
        case age = "age"
        case mail = "email"
        case twitter = "Twitter_ID"
        case github = "Github_ID"
        case imageURL = "user_image_url"
        case id = "id"
    }
}
