//
//  AppRequest.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Foundation
import Alamofire

struct StackMessageRequest: APIRequest {
    
    static var httpMethod: HTTPMethod { return .post }
    var header: Headers
    var isAPIHost: BaseURL { return .slack }
    var isHeaders: Headers { return .none }
    var path: String { return AppUser.slackURL }
    
    var parameter: [String: String]
    
    var parameters: [String : String] {
        return parameter
    }
}
