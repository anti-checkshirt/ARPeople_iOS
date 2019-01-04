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
    func didTappendButton()
}

class DoneBarButtonView: UIView {
    
    private let doneButton = UIButton()
    let f = CGRect(x: 0, y: 0, width: 66, height: 34)
    weak var delegate: DoneBarButtonViewDelegate?
    let disposeBag = DisposeBag()
    
    init() {
        super.init(frame: f)
        
        setUp()
    }
    
    init(image: UIImage?) {
        let frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        super.init(frame: frame)
        
        doneButton.setImage(image, for: .normal)
        doneButton.backgroundColor = .blue
        doneButton.layer.cornerRadius = 17
        
        doneButton.rx.tap.subscribe(onNext: { _ in
            self.delegate?.didTappendButton()
        }).disposed(by: self.disposeBag)
        doneButton.frame = frame
        self.addSubview(doneButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setUp()
    }
    
    private func setUp() {
        doneButton.setTitle("完了", for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        doneButton.backgroundColor = .blue
        doneButton.layer.cornerRadius = 17
        
        doneButton.rx.tap.subscribe(onNext: { _ in
            self.delegate?.didTappendButton()
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
