//
//  APIResult.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

enum APIResult {
    case success
    case failure(Error, statusCode: error)
}

enum APIDecodingResult<Decoded: Decodable> {
    case success(Decoded)
    case failure(Error, statusCode: error)
    
    func concealingDecodedValue(afterHandlingBy decodedValueHandler: (Decoded) -> Void) -> APIResult {
        switch self {
        case .success(let decoded):
            decodedValueHandler(decoded)
            return .success
        case .failure(let error, let statusCode):
            return .failure(error, statusCode: statusCode)
        }
    }
}
