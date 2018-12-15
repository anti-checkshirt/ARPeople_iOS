//
//  HomeViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class HomeViewController: UIViewController {
    
    @IBOutlet var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    private func setLayout() {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
    }
}
