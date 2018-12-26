//
//  AccessTokenModel.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation

struct AccessTokenModel: Codable {
    
    /// アクセストークン
    let token: String
}

extension AccessTokenModel {
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
    }
}
