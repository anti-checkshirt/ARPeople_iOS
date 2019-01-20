//
//  UserLevel.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/12.
//  Copyright © 2019 tomoki. All rights reserved.
//

import SwiftyUserDefaults

// MARK: UserLevel

enum UserLevel: Int, DefaultsSerializable {
    /// 登録してない
    case unregistered
    
    /// 顔写真を登録してない
    case unlearned
    
    /// 登録済み
    case registered
}
