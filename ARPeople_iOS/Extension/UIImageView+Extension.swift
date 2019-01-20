//
//  UIImageView+Extension.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    func setImage(url: String) {
        guard let url = URL(string: url) else { return }
        Nuke.loadImage(with: url, into: self)
    }
}
