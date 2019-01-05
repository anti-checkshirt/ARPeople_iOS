//
//  ImageRequest.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Foundation
import Alamofire

struct ImageRequest {
    static func send(_ image: Data, to url: String) {
        
        let header = ["Authorization": AppUser.token]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(image, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to: url, headers: header) { encodingResult in
            switch encodingResult {
            case .success(request: let upload, _, _):
                upload.responseJSON{ response in
                    print(response)
                    print(response.response?.statusCode ?? "")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
