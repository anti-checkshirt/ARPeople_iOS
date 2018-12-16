//
//  ImageUploadViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/16.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import Alamofire
import DKImagePickerController

class ImageUploadViewController: UIViewController {
    
    private var images = [UIImage]()
    private var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func uplode(_ sender: Any) {
        let pickerController = DKImagePickerController()
        // 選択可能上限の設定もできます
        pickerController.maxSelectableCount = 10
        pickerController.didSelectAssets = { [self] (assets: [DKAsset]) in
            for asset in assets {
                asset.fetchFullScreenImage(completeBlock: { (image, info) in
                    guard let image = image else { return }
                    self.images.append(image)
                    self.count += 1
                    if self.count == 10 {
                        self.showRequest()
                    }
                })
            }
        }
        self.present(pickerController, animated: true)
    }
    
    private func showRequest() {
        print("showRequest")
        let url = "http://192.168.11.8:3000/api/v1/setting"
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                for image in self.images {
                    guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
                    multipartFormData.append(imageData, withName: "image1", fileName: "test.jpeg", mimeType: "image/jpeg")
                }
        },
            to: url,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        print(response)
                    }
                case .failure(let error):
                    print(error)
                }
        })
    }
}
