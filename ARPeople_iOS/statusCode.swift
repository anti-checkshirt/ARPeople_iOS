//
//  statusCode.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/12.
//  Copyright © 2019 tomoki. All rights reserved.
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
    
    var title: String {
        switch self {
        case .badRequest:
            return "失敗"
        case .unauthorized:
            return "失敗"
        case .notFound:
            return "混雑中"
        case .conflict:
            return "失敗"
        case .internalServerError:
            return "サーバーエラー"
        case .none:
            return "失敗"
        }
    }
    
    var message: String {
        switch self {
        case .badRequest:
            return "再度ログインしてください"
        case .unauthorized:
            return "認証に失敗しました"
        case .notFound:
            return "サーバーが落ちています"
        case .conflict:
            return "再度ログインしてください"
        case .internalServerError:
            return "現在アクセス出来ません"
        case .none:
            return "アクセスに失敗しました"
        }
    }
}
