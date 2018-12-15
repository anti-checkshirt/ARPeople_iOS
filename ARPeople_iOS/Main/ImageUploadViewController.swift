//
//  ImageUploadViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/16.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import DKImagePickerController

class ImageUploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func uplode(_ sender: Any) {
        let pickerController = DKImagePickerController()
        // 選択可能上限の設定もできます
        pickerController.maxSelectableCount = 5
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            for asset in assets {
                asset.fetchFullScreenImage(completeBlock: { (image, info) in
                    guard let image = image else { return }
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                })
            }
        }
        self.present(pickerController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
