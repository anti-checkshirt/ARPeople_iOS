//
//  APIClient.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Alamofire

struct APIClient {
    
    private init() {}
    
    /// レスポンスのないとき
    static func send<Request: APIRequest>(_ request: Request,
                                          preprocessOnSuccess: @escaping () -> Void = {},
                                          completion: @escaping (APIResult) -> Void) {
        request.alamofireRequest
            .responseString { response in
                let statusCode = status(response.response?.statusCode)
                let result: APIResult
                defer { completion(result) }
                
                switch response.result {
                case .success(_):
                    preprocessOnSuccess()
                    result = .success
                case .failure(let error):
                    result = .failure(error, statusCode: statusCode)
                }
        }
    }
    
    /// レスポンスがあるとき
    static func send<Request: DecodingRequest>(_ request: Request,
                                               decodingCompletion: @escaping (APIDecodingResult<Request.Decoded>) -> Void) {
        request.alamofireRequest
            .responseJSON { response in
                let result: APIDecodingResult<Request.Decoded>
                defer { decodingCompletion(result) }
                
                let statusCode = status(response.response?.statusCode)
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        assertionFailure("response.resultがsuccessならresponse.dataはnilでないはず")
                        result = .failure(NSError(), statusCode: statusCode)
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode(Request.Decoded.self, from: data)
                        result = .success(decoded)
                    } catch {
                        print("ERROR:", "\(type(of: Request.Decoded.self))型へのデコードに失敗しました")
                        debugPrint(error)
                        result = .failure(error, statusCode: statusCode)
                    }
                case .failure(let error):
                    print("ERROR:", "\(type(of: Request.Decoded.self))型へ変換するJSONが取得できませんでした")
                    result = .failure(error, statusCode: statusCode)
                }
        }
    }
    
    private static func status(_ statusCode: Int?) -> error {
        guard let code = statusCode else { return error.none }
        switch code {
        case 400:
            return error.badRequest
        case 401:
            return error.unauthorized
        case 404:
            return error.notFound
        case 409:
            return error.conflict
        case 500:
            return error.internalServerError
        default:
            return error.none
        }
    }
}

private extension APIRequest {
    
    var alamofireRequest: DataRequest {
        return Alamofire.request(self.urlComponents,
                                 method: Self.httpMethod,
                                 parameters: self.parameters,
                                 encoding: JSONEncoding.default,
                                 headers: self.headers)
            .validate(statusCode: 200..<300)
    }
    
}


