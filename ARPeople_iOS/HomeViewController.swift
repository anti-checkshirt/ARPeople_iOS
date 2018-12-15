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
    
    var faceTracker: FaceTracker? = nil
    @IBOutlet var sceneView: ARSCNView!
    var rectView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.showsStatistics = true
        sceneView.scene = SCNScene()
        sceneView.autoenablesDefaultLighting = true

        setLayout()
    }
    
    private func getFaceImage() {
        let image = sceneView.snapshot()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.rectView.layer.borderWidth = 3
        rectView.layer.borderColor = UIColor.yellow.cgColor
        self.view.addSubview(self.rectView)
        faceTracker = FaceTracker(view: self.sceneView, findface:{arr in
            //一番の顔だけ使う
            let rect = arr[0]
            
            //四角い枠を顔の位置に移動する
            self.rectView.frame = rect
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    private func setLayout() {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
    }
}
