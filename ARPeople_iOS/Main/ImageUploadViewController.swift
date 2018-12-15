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

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func uplode(_ sender: Any) {
        let pickerController = DKImagePickerController()
        // 選択可能上限の設定もできます
        pickerController.maxSelectableCount = 10
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            // 必ず10枚を選択
            if assets.count == 10 { return }
            for asset in assets {
                asset.fetchFullScreenImage(completeBlock: { (image, info) in
                    guard let image = image else { return }
                    self.images.append(image)
                })
            }
        }
        self.present(pickerController, animated: true)
    }
    
    private func showRequest() {
        let url = "http://localhost:3000/"
        let parameters: Parameters = [
            "image1": images[0],
            "image2": images[1],
            "image3": images[2],
            "image4": images[3],
            "image5": images[4],
            "image6": images[5],
            "image7": images[6],
            "image8": images[7],
            "image9": images[8],
            "image10": images[9]
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
            guard let data = response.data else { return }
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                let result = try! decoder.decode(User.self, from: data)
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
