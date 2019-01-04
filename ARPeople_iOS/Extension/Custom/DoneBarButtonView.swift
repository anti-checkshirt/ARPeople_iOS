//
//  hoge.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol DoneBarButtonViewDelegate: class {
    func didTappendButton(_ doneBarButtonView: DoneBarButtonView, currentButton: DoneBarButtonView.currentButton)
}

class DoneBarButtonView: UIView {
    
    private let doneButton = UIButton()
    let f = CGRect(x: 0, y: 0, width: 66, height: 34)
    weak var delegate: DoneBarButtonViewDelegate?
    let disposeBag = DisposeBag()
    
    init(currentButton: currentButton) {
        super.init(frame: f)
        
        setUp(currentButton)
    }
    
    init(image: UIImage?, currentButton: currentButton) {
        let frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        super.init(frame: frame)

        doneButton.setImage(image, for: .normal)
        doneButton.imageView?.tintColor = .white
        doneButton.backgroundColor = .blue
        doneButton.layer.cornerRadius = 17
        
        doneButton.rx.tap.subscribe(onNext: { _ in
            self.delegate?.didTappendButton(self, currentButton: currentButton)
        }).disposed(by: self.disposeBag)
        doneButton.frame = frame
        self.addSubview(doneButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setUp(.done)
    }
    
    private func setUp(_ currentButton: currentButton) {
        doneButton.setTitle("完了", for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        doneButton.backgroundColor = .blue
        doneButton.layer.cornerRadius = 17
        
        doneButton.rx.tap.subscribe(onNext: { _ in
            self.delegate?.didTappendButton(self, currentButton: currentButton)
        }).disposed(by: self.disposeBag)
        
        self.addSubview(doneButton)
        doneButton.frame = f
    }
}

extension DoneBarButtonView {
    enum currentButton {
        case back
        case setting
        case done
    }
}
