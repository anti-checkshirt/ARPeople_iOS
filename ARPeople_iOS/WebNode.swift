//
//  WebNode.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import ARKit
import SceneKit
import WebKit

class WebNode: SCNNode {
    
    init(image:UIImage, panelColor: UIColor, width: CGFloat) {
        super.init()
        //        node.geometry = SCNBox(width: 0.2, height: 0.1, length: 0, chamferRadius: 0)
        let panelNode = SCNNode(geometry: SCNBox(width: width, height: width * 0.5, length: 0, chamferRadius: 0))
        
        let material_front = SCNMaterial()
        material_front.diffuse.contents = image
        let material_other = SCNMaterial()
        material_other.diffuse.contents = panelColor
        panelNode.geometry?.materials = [material_front, material_other, material_other, material_other, material_other, material_other]
        
        addChildNode(panelNode)
    }
    
    /// view to image
    func createImage(view:UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        view.isHidden = false // 画像を取得する間だけ表示
        view.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        view.isHidden = true // 再び非表示
        return image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class customView: UIView {
    
    let label = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        label.text = "ともき"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize: 125)
        label.frame = self.bounds
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

