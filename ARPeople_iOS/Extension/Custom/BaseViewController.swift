//
//  BaseViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController, SwipeBackable {
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSwipeBack()
    }
    
    func error(statusCode: Int?) {
        guard let status = statusCode else { return }
        print(status)
        let alert = UIAlertController(title: "失敗", message: "再度ログインしてください", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "OK", style: .default) { _ in
            print("aa")
        }
        alert.addAction(doneButton)
        self.present(alert, animated: true)
    }
}

protocol SwipeBackable {
    func setSwipeBack()
}

extension SwipeBackable where Self: UIViewController {
    func setSwipeBack() {
        let target = self.navigationController?.value(forKey: "_cachedInteractionController")
        let recognizer = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        self.view.addGestureRecognizer(recognizer)
    }
}
