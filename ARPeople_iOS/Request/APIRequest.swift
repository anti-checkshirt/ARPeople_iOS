//
//  APIRequest.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Alamofire

enum Headers {
    case none
    
    var item: [String: String] {
        switch self {
        case .none:
            return [:]
        }
    }
}

protocol APIRequest {
    static var httpMethod: HTTPMethod { get }
    var header: Headers { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

extension APIRequest {
    var headers: [String: String] { return header.item }
    
    /// APIホスト
    var baseURL: URL {
        return URL(string: AppUser.stagingURL)!
    }
    
    /// バージョン
    var version: URL {
        return URL(string: "/api/v1")!
    }
    
    var urlComponents: URLComponents {
        guard let urlComponents = URLComponents(string: "\(self.baseURL)\(self.version)\(self.path)") else {
            assertionFailure("\(self.path)は無効なURLです")
            return URLComponents()
        }
        return urlComponents
    }
}

protocol DecodingRequest: APIRequest {
    associatedtype Decoded: Decodable
}
