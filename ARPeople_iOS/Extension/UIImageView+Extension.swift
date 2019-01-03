//
//  UIImageView+Extension.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    func setImage(url: String) {
        Alamofire.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                self.image = UIImage(data: data)
            case .failure:
                self.image = UIImage()
            }
        }
    }
}
