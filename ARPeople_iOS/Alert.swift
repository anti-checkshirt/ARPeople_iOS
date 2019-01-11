//
//  Alert.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/12.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

struct Alert {
    
    private var topViewController: UIViewController? {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }
    
    func error(_ statusCode: error) {
        let alert = UIAlertController(title: statusCode.title, message: statusCode.message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "OK", style: .default) { _ in
            print("aa")
        }
        alert.addAction(doneButton)
        topViewController?.present(alert, animated: true)
    }
}
