//
//  ARView.swift
//  ARKit-prac
//
//  Created by 金澤帆高 on 2024/02/15.
//

import SwiftUI
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @ObservedObject var viewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARSCNView {
        let view = ARSCNView()
        view.session = viewModel.session
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
            guard let objectAnchor = anchor as? ARObjectAnchor else { return }
            
            // メインスレッドでUIの更新を行う
            DispatchQueue.main.async {
                // 物体の上に球体を配置する
                let sphere = SCNSphere(radius: 0.05) // 球体のサイズを設定
                let sphereNode = SCNNode(geometry: sphere)
                sphereNode.position = SCNVector3(0, 0.05, 0) // 物体の中心より少し上に配置
                
                // 球体のマテリアル（外観）を設定
                let material = SCNMaterial()
                material.diffuse.contents = UIColor.red // 色を赤に設定
                sphere.materials = [material]
                
                node.addChildNode(sphereNode) // 認識された物体のノードに球体を追加
            }
        }
    }
}
