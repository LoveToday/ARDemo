//
//  ViewController.swift
//  SCence01-坐标系
//
//  Created by 陈江林 on 2019/11/8.
//  Copyright © 2019 陈江林. All rights reserved.
//

import UIKit
import SceneKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scnView = SCNView(frame: self.view.bounds)
        self.view.addSubview(scnView)
        
        let sence = SCNScene()
        scnView.scene = sence
        
        let node0 = SCNNode()
        node0.geometry = SCNSphere(radius: 1)
        node0.position = SCNVector3(0, 0, -4)
        node0.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        
        sence.rootNode.addChildNode(node0)
        
        
        let cameraNode = SCNNode()
        cameraNode.position = SCNVector3(0, 0, 4)
        let camera = SCNCamera()
        cameraNode.camera = camera
//        camera.focalDistance = 50
        camera.xFov = 40
        sence.rootNode.addChildNode(cameraNode)
        
        print(camera.orthographicScale)
        
        
        
    }


}

