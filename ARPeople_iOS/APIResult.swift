//
//  APIResult.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

enum error {
    /// 400
    case badRequest
    
    /// 401
    case unauthorized
    
    /// 404
    case notFound
    
    /// 409
    case conflict
    
    /// 500
    case internalServerError
    
    /// 該当なし
    case none
    
    var message: String {
        switch self {
        case .badRequest:
            return ""
        case .unauthorized:
            return ""
        case .notFound:
            return ""
        case .conflict:
            return ""
        case .internalServerError:
            return ""
        case .none:
            return ""
        }
    }
}

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
