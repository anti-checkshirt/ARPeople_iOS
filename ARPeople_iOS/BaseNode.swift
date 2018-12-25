//
//  BaseNode.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/16.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class BaseNode: SCNNode {
    init(image: UIImage, width: CGFloat) {
        super.init()
        let panelNode = SCNNode(geometry: SCNBox(width: width, height: width * 0.5, length: 0, chamferRadius: 0))
        
        let front = SCNMaterial()
        front.diffuse.contents = image
        let other = SCNMaterial()
        other.diffuse.contents = UIColor.clear
        panelNode.geometry?.materials = [front, other, front, other, other, other]
        
        addChildNode(panelNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
