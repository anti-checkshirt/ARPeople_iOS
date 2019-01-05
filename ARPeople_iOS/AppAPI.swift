//
//  AppAPI.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Foundation

struct AppAPI {
    
    private init() {}
    
    /// SlackにMessageを送信
    static func fetchSlackMessage(parameter: [String: String], completion: @escaping (APIResult) -> Void) {
        let request = StackMessageRequest(parameter: parameter)
        APIClient.send(request, completion: completion)
    }
}
