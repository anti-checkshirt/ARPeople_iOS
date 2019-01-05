//
//  ImageRequest.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Alamofire
import DKImagePickerController

struct ImageRequest {
    
    private var topViewController: UIViewController? {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }
    
    func openView() {
        guard let vc = topViewController else { return }
        let pickerController = DKImagePickerController()
        pickerController.maxSelectableCount = 10
        pickerController.didSelectAssets = { [self] (assets: [DKAsset]) in
            for asset in assets {
                asset.fetchFullScreenImage(completeBlock: { (image, info) in
                    guard let image = image else { return }
                    guard let imageData = image.jpegData(compressionQuality: 1.0) else { return }
                    self.send(imageData, to: "\(AppUser.stagingURL)/user_image")
                })
            }
        }
        vc.present(pickerController, animated: true)
    }
    
    private func send(_ image: Data, to url: String) {
        
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
