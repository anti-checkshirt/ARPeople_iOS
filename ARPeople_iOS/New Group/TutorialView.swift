//
//  TutorialView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/20.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

enum Tutorial {
    case first
    case second
    case thaad
}

class TutorialView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setUp(tutorial: Tutorial) {
        switch tutorial {
        case .first:
            imageView.image = UIImage(named: "tutorial1")
            titleLabel.text = "自分の顔写真を登録する"
        case .second:
            imageView.image = UIImage(named: "tutorial2")
            titleLabel.text = "検索したい人の顔を写す"
        case .thaad:
            imageView.image = UIImage(named: "tutorial3")
            titleLabel.text = "検索した人の情報が表示されます"
        }
    }
}
