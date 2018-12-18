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
    private var hogeView = SCNNode()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.scene = SCNScene()
        sceneView.autoenablesDefaultLighting = true

        setLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        getFaceImage()
        displayNode()
    }
    
    private func displayNode() {
        hogeView.removeFromParentNode()
        let baseView = UserView(frame: view.bounds)
        baseView.setUp()
        guard let image = createImage(view: baseView) else { return }
        let node = BaseNode(image: image, width: 0.3)
        
        let position = SCNVector3(x: 0, y: 0, z: -1) // ノードの位置は、左右：0m 上下：0m　奥に100cm
        if let camera = sceneView.pointOfView {
            node.position = camera.convertPosition(position, to: nil) // カメラ位置からの偏差で求めた位置
        }
        sceneView.scene.rootNode.addChildNode(node) // 生成したノードをシーンに追加する
        hogeView = node
    }
    
    func resize(image: UIImage, width: Double) -> UIImage {
        
        // オリジナル画像のサイズからアスペクト比を計算
        let aspectScale = image.size.height / image.size.width
        
        // widthからアスペクト比を元にリサイズ後のサイズを取得
        let resizedSize = CGSize(width: width, height: width * Double(aspectScale))
        
        // リサイズ後のUIImageを生成して返却
        UIGraphicsBeginImageContext(resizedSize)
        image.draw(in: CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
    
    private func getFaceImage() {
        let image = sceneView.snapshot()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
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
    
    
    private func createImage(view:UIView) -> UIImage? {
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
}
