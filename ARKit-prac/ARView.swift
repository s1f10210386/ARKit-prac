//
//import SwiftUI
//import RealityKit
//import ARKit
//
//
//struct ARViewContainer: UIViewRepresentable {
//    @ObservedObject var viewModel: ARViewModel
//    
//    func makeUIView(context: Context) -> ARSCNView {
//        let view = ARSCNView()
//        view.session = viewModel.session
//        view.delegate = context.coordinator
//        return view
//    }
//    
//    func updateUIView(_ uiView: ARSCNView, context: Context) {}
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: NSObject, ARSCNViewDelegate {
//        var parent: ARViewContainer
//        
//        init(_ parent: ARViewContainer) {
//            self.parent = parent
//        }
//        
//        func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//            guard let objectAnchor = anchor as? ARObjectAnchor else { return }
//            
//            // メインスレッドでUIの更新を行う
//            DispatchQueue.main.async {
//                // 物体の上に球体を配置する
//                let sphere = SCNSphere(radius: 0.05) // 球体のサイズを設定
//                let sphereNode = SCNNode(geometry: sphere)
//                sphereNode.position = SCNVector3(0, 0.05, 0) // 物体の中心より少し上に配置
//                
//                // 球体のマテリアル（外観）を設定
//                let material = SCNMaterial()
//                material.diffuse.contents = UIColor.red // 色を赤に設定
//                sphere.materials = [material]
//                
//                node.addChildNode(sphereNode) // 認識された物体のノードに球体を追加
//            }
//        }
//    }
//}
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @ObservedObject var viewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        viewModel.arView.session.delegate = context.coordinator
        return viewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for anchor in anchors {
                guard let objectAnchor = anchor as? ARObjectAnchor else { continue }
                
                // RealityKitで球体を追加
                let sphere = ModelEntity(mesh: .generateSphere(radius: 0.05), materials: [SimpleMaterial(color: .red, isMetallic: true)])
                let anchorEntity = AnchorEntity(anchor: objectAnchor)
                anchorEntity.addChild(sphere)
                
                DispatchQueue.main.async {
                    self.parent.viewModel.arView.scene.addAnchor(anchorEntity)
                }
            }
        }
    }
}
