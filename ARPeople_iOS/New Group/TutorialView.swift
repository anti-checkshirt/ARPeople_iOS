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
        case .second:
            imageView.image = UIImage(named: "tutorial2")
        case .thaad:
            imageView.image = UIImage(named: "tutorial3")
        }
    }
}
