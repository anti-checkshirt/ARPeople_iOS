//
//  SettingUserViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import Alamofire
import DKImagePickerController

class SettingUserViewController: BaseViewController {
    
    @IBOutlet private weak var twitterInputField: UITextField!
    @IBOutlet private weak var githubInputField: UITextField!
    @IBOutlet private weak var uploadButton: UIButton!
    
    private var images = [UIImage]()
    private var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        twitterInputField.delegate = self
        githubInputField.delegate = self
        
        uploadButton.rx.tap.subscribe(onNext: { _ in
            self.selectImage()
        }).disposed(by: disposeBag)
    }
    
    private func selectImage(){
        let pickerController = DKImagePickerController()
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
        let url = "\(AppUser.stagingURL)/images"
        let headers: HTTPHeaders = [
            "Authorization": "\(AppUser.token)"
        ]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                var number = 1
                for image in self.images {
                    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
                    multipartFormData.append(imageData, withName: "image\(number)", fileName: "image\(number).jpeg", mimeType: "image/jpeg")
                    number += 1
                }
        }, to: url, headers: headers, encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                print(encodingResult)
                upload.responseJSON { response in
                    print(response)
                    self.count = 0
                    self.images.removeAll()
                }
                upload.uploadProgress { progress in
                    print(progress.fractionCompleted)
                }
            case .failure(let error):
                print(error)
                self.count = 0
                self.images.removeAll()
            }
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SettingUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == twitterInputField {
            githubInputField.becomeFirstResponder()
        } else {
            githubInputField.resignFirstResponder()
        }
        return true
    }
}
