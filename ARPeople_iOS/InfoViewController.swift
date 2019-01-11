//
//  InfoViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import Device

class InfoViewController: BaseViewController {
    
    @IBOutlet private weak var nameInputField: UITextField!
    @IBOutlet private weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "お問い合わせ"
        nameInputField.delegate = self
        nameInputField.becomeFirstResponder()
        let barButton = UIBarButtonItem(title: "送信", style: .done, target: self, action: #selector(InfoViewController.send))
        barButton.tintColor = .blue
        barButton.isEnabled = false
        navigationItem.setRightBarButtonItems([barButton], animated: true)
        
        textView.rx.text.asDriver().drive(onNext: { outPutText in
            guard let text = outPutText else { return }
            if text.count == 0 {
                barButton.isEnabled = false
            } else {
                barButton.isEnabled = true
            }
        }).disposed(by: self.disposeBag)
    }
    
    @objc func send() {
        nameInputField.resignFirstResponder()
        textView.resignFirstResponder()
        guard let name = nameInputField.text else { return }
        guard let message = textView.text else { return }
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        
        let text = """
        時間: \(now())
        端末名: \(Device.version())
        アプリバージョン: \(version)
        名前: \(name)
        お問い合わせ内容: \(message)
        """
        let parameters: [String: String] = [
            "text": text,
            "username": "AR名刺"
        ]
        
        AppAPI.fetchSlackMessage(parameter: parameters) { (result) in
            switch result {
            case .success:
                print("succcess")
//                PopUp().topMessage(text: "送信完了")
                self.navigationController?.popViewController(animated: true)
            case .failure(_, let statusCode):
                self.error(statusCode: statusCode)
            }
        }
    }
    
    private func now() -> String {
        let f = DateFormatter()
        f.timeStyle = .full
        f.dateStyle = .long
        f.locale = Locale(identifier: "ja_JP")
        let time = f.string(from: Date())
        return time
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension InfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textView.becomeFirstResponder()
        return true
    }
}
